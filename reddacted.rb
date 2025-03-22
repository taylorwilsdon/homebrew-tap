class Reddacted < Formula
  include Language::Python::Virtualenv

  desc "Analyze Reddit comments for PII and perform sentiment analysis"
  homepage "https://github.com/taylorwilsdon/reddacted"
  url "https://github.com/taylorwilsdon/reddacted/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "01e711f8cc3529aa1b5800a7307a4ad8595a7aafe09e5ce1f2eec68098bedcd8"
  license "MIT"

  depends_on "python@3.11"

  resource "cliff" do
    url "https://files.pythonhosted.org/packages/62/74/c7fb720990b17da636064a7993506c230f7a913b752f0116ad2a2e39d621/cliff-4.9.1.tar.gz"
    sha256 "5b392198293c0b9225d459be8ba710cf8248f1ee33006bdeb3d92fb0012592b4"
  end

  resource "praw" do
    url "https://files.pythonhosted.org/packages/4c/52/7dd0b3d9ccb78e90236420ef6c51b6d9b2400a7229442f0cfcf2258cce21/praw-7.8.1.tar.gz"
    sha256 "3c5767909f71e48853eb6335fef7b50a43cbe3da728cdfb16d3be92904b0a4d8"
  end

  resource "nltk" do
    url "https://files.pythonhosted.org/packages/3c/87/db8be88ad32c2d042420b6fd9ffd4a149f9a0d7f0e86b3f543be2eeeedd2/nltk-3.9.1.tar.gz"
    sha256 "87d127bd3de4bd89a4f81265e5fa59cb1b199b27440175370f7417d2bc7ae868"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "openai" do
    url "https://files.pythonhosted.org/packages/3f/6b/6b002d5d38794645437ae3ddb42083059d556558493408d39a0fcea608bc/openai-1.68.2.tar.gz"
    sha256 "b720f0a95a1dbe1429c0d9bb62096a0d98057bcda82516f6e8af10284bdd5b19"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/ab/3a/0316b28d0761c6734d6bc14e770d85506c986c85ffb239e688eeaab2c2bc/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/41/62/4af4689dd971ed4fb3215467624016d53550bff1df9ca02e7625eec07f8b/textual-2.1.2.tar.gz"
    sha256 "aae3f9fde00c7440be00e3c3ac189e02d014f5298afdc32132f93480f9e09146"
  end



  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"reddacted", "--help"
  end
end
