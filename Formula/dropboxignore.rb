class Dropboxignore < Formula
  desc "Command-line tool for ignoring files in Dropbox"
  homepage "https://github.com/sp1thas/dropboxignore"
  url "https://github.com/sp1thas/dropboxignore/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "4ef5981c24fe6f5f4c9d4e955f396d48e56ef82b5b0c6fdf8cecb54572e17cf5"
  license "GPL-3.0-only"

  bottle do
    sha256 arm64_sequoia:  "7effcbad404640b62723336fc0d1024f04f3cf98e4e40d595243512422897f4f"
    sha256 arm64_sonoma:   "65b376bbaea1ccebe7b46ed808d280c966c0e24fb22f6e92e86dd6eb9d769b75"
    sha256 arm64_ventura:  "3e182ba99072bc793eaa3e93761288026df7fec9520a39f3f51f1436fe7f5230"
    sha256 arm64_monterey: "1e6ab666ea444efe10b8892b9923264b8dc0d5961674b3a0937a9cd94397542b"
    sha256 sonoma:         "010728f54b885a9c8697a81b3602427ccabb10da153d0d74a25526a8144a0e1c"
    sha256 ventura:        "4b2439ff98f5db6e8c4e3894ba0ab09a4e38e7404a7db950b42de46afeddc62a"
    sha256 monterey:       "361d7e19f0811037af034bb5a7e582c0cea350cc5a9754f0d05e0094faadf5bb"
    sha256 x86_64_linux:   "6df41a07d6bd52713e700a83a2994c5955b305ee068b73c50e4786cbb8213dae"
  end

  depends_on "diffutils"
  depends_on "grep"

  def install
    # Do not use 'make install' as it uses hardcoded destination
    bin.install "src/bin/cli.sh" => "dropboxignore"
  end

  test do
    assert_match "dropboxignore: v#{version}", shell_output("#{bin}/dropboxignore version")
  end
end
