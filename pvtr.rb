# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.23.0/pvtr_Darwin_all.tar.gz"
    sha256 "3595e5767bc8a7980a7f01005648900808b76bf2cf3eeff5105d8f2e6baca59a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.23.0/pvtr_Linux_x86_64.tar.gz"
    sha256 "79f69ca91470d99269f957703784b57de532f0a242d9c3c442ff0b0d266564f8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.23.0/pvtr_Linux_arm64.tar.gz"
    sha256 "c9af5d125d6335cb4a77ec658e83f295dfa920eaffef27e97223a9ae060b3f9c"
  end

  link_overwrite "bin/privateer"

  def install
    bin.install "pvtr"
    bin.install_symlink "pvtr" => "privateer"
  end

  test do
    system "#{bin}/pvtr", "version"
  end
end
