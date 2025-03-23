class Reddacted < Formula
  include Language::Python::Virtualenv

  desc "Analyze Reddit comments for PII and perform sentiment analysis"
  homepage "https://github.com/taylorwilsdon/reddacted"
  url "https://github.com/taylorwilsdon/reddacted/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "01e711f8cc3529aa1b5800a7307a4ad8595a7aafe09e5ce1f2eec68098bedcd8"
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
