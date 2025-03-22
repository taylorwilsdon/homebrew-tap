class Reddacted < Formula
  include Language::Python::Virtualenv

  desc "Analyze Reddit comments for PII and perform sentiment analysis"
  homepage "https://github.com/taylorwilsdon/reddacted"
  url "https://github.com/taylorwilsdon/reddacted/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "01e711f8cc3529aa1b5800a7307a4ad8595a7aafe09e5ce1f2eec68098bedcd8"
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
