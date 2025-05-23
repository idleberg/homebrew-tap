class Nixfmt < Formula
  desc "Command-line tool to format Nix language code"
  homepage "https://github.com/NixOS/nixfmt"
  url "https://github.com/NixOS/nixfmt/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "abbe204306daab5b3908abdcdf3af78b7d5a4a062ef4c39197ec612a2ebc4354"
  license "MPL-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "edd2d0dcc5ca368334522b123210e7d9d3336efc5e0091f12500fa02a8e304d8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "065f088b4c9681f571c8e73b76bcd730ac34b5ab86ac011707d31b28479b8533"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "71dd1af5b0c2c9a040bac2d58965ba3141dbb2c23a95f36d7ad7fb2b2e1b40fa"
    sha256 cellar: :any_skip_relocation, sonoma:        "985171f35c2c617499f333b4926367ee656660b85e9a83c045a691633e1af9d1"
    sha256 cellar: :any_skip_relocation, ventura:       "b41b708bb2a20b5f006d3123070d7a9d16c02796201a86fa5456b7673a299994"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "232ea0628f6282522669f5d4763bfe740ce920696e1f4fb0e5c68f4eabc186c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2c8e1672901d8376fcbcc0579302f0338629852fde0a262cdab694613fe89785"
  end

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build

  def install
    system "cabal", "v2-update"
    system "cabal", "v2-install", "--allow-newer=base", *std_cabal_v2_args
  end

  test do
    assert_equal "nixfmt v#{version}", shell_output("#{bin}/nixfmt --version").chomp

    ENV["LC_ALL"] = "en_US.UTF-8"
    input_nix = "{description=\"Demo\";outputs={self}:{};}"
    output_nix = "{\n  description = \"Demo\";\n  outputs = {self}: {};\n}"

    (testpath/"nixfmt_test.nix").write input_nix
    system bin/"nixfmt", "nixfmt_test.nix"
    assert_equal output_nix, (testpath/"nixfmt_test.nix").read.strip
  end
end
