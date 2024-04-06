class Dropboxignore < Formula
  desc "CLI tool for ignoring files in Dropbox"
  homepage "https://dropboxignore.simakis.me/"
  url "https://github.com/sp1thas/dropboxignore/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "4ef5981c24fe6f5f4c9d4e955f396d48e56ef82b5b0c6fdf8cecb54572e17cf5"
  license "GPL-3.0-only"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, sonoma:         "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, ventura:        "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, monterey:       "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7f4f8b62a3bced7309be6d3d316c9b3594c16a27c71d8a4952ba7d0d4a7f5be9"
  end

  depends_on "diffutils"
  depends_on "grep"

  def install
    # Do not use 'make install' as it uses hardcoded destination
    bin.install "bin/dropboxignore.sh" => "dropboxignore"
  end

  test do
    assert_match "dropboxignore: v#{version}", shell_output("#{bin}/dropboxignore version")
  end
end
