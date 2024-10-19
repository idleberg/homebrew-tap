cask "krampus" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.1"
  sha256 arm:   "c3e344943c5fe31a2a048f546819121350bb6adc1138ce527156f735643ef295",
         intel: "b1d22095850b986d8ef971432a7b5615fba6343b4c66e3b145fdcf25d9c99240"

  url "https://github.com/idleberg/krampus/releases/download/v#{version}/krampus-#{version}-Darwin-#{arch}.tar.gz"
  name "krampus"
  desc "Command-line tool to kill one or more processes by their port number"
  homepage "https://github.com/idleberg/krampus"

  binary "krampus"
end
