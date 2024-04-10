class Krampus < Formula
  desc "Command-line tool to kill one or more processes by their port number"
  homepage "https://github.com/idleberg/krampus"
  url "https://github.com/idleberg/krampus/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e84243c92d44f8e1a5ef63af71b0f813be7b1c5656cb2d0ff72adcbeaad59d8c"
  license "MIT"
  version "0.2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "558728b5567bd1dc68e9612a51df346c56019de2f69df592150e77e46a979061"
    sha256 cellar: :any_skip_relocation, sonoma:         "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, ventura:        "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, monterey:       "d715b64a1f5d1122ec65d91285a05971027e1650826799f470b9c8896c56f1cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7f4f8b62a3bced7309be6d3d316c9b3594c16a27c71d8a4952ba7d0d4a7f5be9"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}")
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/krampus --version").chomp
  end
end
