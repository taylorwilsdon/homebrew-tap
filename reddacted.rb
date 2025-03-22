class Reddacted < Formula
  include Language::Python::Virtualenv

  desc "Analyze Reddit comments for PII and perform sentiment analysis"
  homepage "https://github.com/taylorwilsdon/reddacted"
  url "https://github.com/taylorwilsdon/reddacted/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "934d84d0a6dbc32b8c719922c33ff5b38437d7ee134e5884b2ba34b46aab105b"
  license "MIT"

  depends_on "python@3.11"

  resource "uv" do
    url "https://files.pythonhosted.org/packages/9f/c1/a60065b94012132ddc4259b1c66f074acdd369b920398e31e12a3d536672/uv-0.6.9.tar.gz"
    sha256 "ab6b55d14450175e79a8a819fc2728bfb6adf289ce03ab312654091fa7f6101a"
  end


  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"reddacted", "--help"
  end
end
