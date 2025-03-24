class Reddacted < Formula
  include Language::Python::Virtualenv

  desc "Analyze Reddit comments for PII and other sensitive information using local or OpenAI API compatible LLMs and perform sentiment analysis, edit and remove comments."
  homepage "https://github.com/taylorwilsdon/reddacted"
  url "https://github.com/taylorwilsdon/reddacted/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "8cd27572cc083a91bb0519da64c2b398470434e8f7a47cd9a77a36531aa942fe"
  license "MIT"

  depends_on "python@3.11"
  depends_on "rust" => :build  # Required for building Rust extensions

  # Python dependencies will be managed by brew update-python-resources
  
  def install
    # Create virtualenv with pip
    venv = virtualenv_create(libexec, "python3.11")
    venv.pip_install "pip"
    
    # Install all dependencies
    resources.each do |r|
      # Handle packages with Rust extensions
      if ["pydantic-core", "regex"].include? r.name
        # These need special handling for Rust components
        r.stage do
          venv.pip_install "--no-binary", ":all:", "."
        end
      else
        venv.pip_install r
      end
    end

    # Install the package itself
    venv.pip_install_and_link buildpath
  end

  test do
    # Verify CLI works
    system bin/"reddacted", "--help"
    # Verify Python module is importable
    system libexec/"bin/python", "-c", "import reddacted"
  end
end
