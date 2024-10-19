class Dbxcli < Formula
  desc "Command-line client for Dropbox"
  homepage "https://github.com/dropbox/dbxcli"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, sonoma:         "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, ventura:        "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, monterey:       "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7f4f8b62a3bced7309be6d3d316c9b3594c16a27c71d8a4952ba7d0d4a7f5be9"
  end

  if OS.mac? and && Hardware::CPU.intel?
    url "https://github.com/dropbox/dbxcli/releases/download/v3.0.0/dbxcli-darwin-amd64"
    sha256 "1149a2aa6a89829c6d540d04cc1db8cf5bb27e3d8b0ec6b32d830a6818bd7573"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dropbox/dbxcli/releases/download/v3.0.0/dbxcli-linux-amd64"
    sha256 "3ff6e29675095063a5ba7101115cf7f809f3deddf14998ac61bf7a0330d736cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/dropbox/dbxcli/releases/download/v3.0.0/dbxcli-linux-arm"
    sha256 "806584e4758e59d753c1d7ed0fe97a7ae43fec0240c3bf4d388360bb51daf346"
  end

  def install
    bin.install "dbxcli-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm" : "amd64"}" => "dbxcli"
  end

  test do
    system "#{bin}/dbxcli", "--version"
  end
end
