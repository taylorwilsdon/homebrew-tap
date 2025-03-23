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
    venv = virtualenv_create(libexec, Formula["python@3.11"].opt_bin/"python3.11")
    
    # Install all dependencies first
    resources.each do |r|
      venv.pip_install r
    end
    
    # Then install the package itself
    venv.pip_install_and_link buildpath, build_isolation: true
  end

  test do
    system bin/"reddacted", "--help"
  end
end
