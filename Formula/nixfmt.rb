class Nixfmt < Formula
  desc "Command-line tool to format Nix language code"
  homepage "https://github.com/NixOS/nixfmt"
  url "https://github.com/NixOS/nixfmt/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "abbe204306daab5b3908abdcdf3af78b7d5a4a062ef4c39197ec612a2ebc4354"
  license "MPL-2.0"
  head "https://github.com/NixOS/nixfmt.git", branch: "master"

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
