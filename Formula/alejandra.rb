class Alejandra < Formula
  desc "The Uncompromising Nix Code Formatter"
  homepage "https://kamadorueda.com/alejandra/"
  url "https://github.com/kamadorueda/alejandra/archive/refs/tags/4.0.0.tar.gz"
  sha256 "f3f9989c3fb6a56e2050bf5329692fae32a2b54be7c0652aa394afe4660ebb74"
  license "UNLICENSE"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "edd2d0dcc5ca368334522b123210e7d9d3336efc5e0091f12500fa02a8e304d8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "065f088b4c9681f571c8e73b76bcd730ac34b5ab86ac011707d31b28479b8533"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "71dd1af5b0c2c9a040bac2d58965ba3141dbb2c23a95f36d7ad7fb2b2e1b40fa"
    sha256 cellar: :any_skip_relocation, sonoma:        "985171f35c2c617499f333b4926367ee656660b85e9a83c045a691633e1af9d1"
    sha256 cellar: :any_skip_relocation, ventura:       "b41b708bb2a20b5f006d3123070d7a9d16c02796201a86fa5456b7673a299994"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "232ea0628f6282522669f5d4763bfe740ce920696e1f4fb0e5c68f4eabc186c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2c8e1672901d8376fcbcc0579302f0338629852fde0a262cdab694613fe89785"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--locked"
     bin.install "target/release/alejandra" => "alejandra"
  end

  test do
    assert_equal "Alejandra #{version}", shell_output("#{bin}/alejandra --version").chomp
  end
end
