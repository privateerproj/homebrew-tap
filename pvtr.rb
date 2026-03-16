# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.18.0/privateer_Darwin_all.tar.gz"
    sha256 "3f08f53d923a43eac9ec9156824248eea65fcff412c9c43f0064036d83890fba"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.18.0/privateer_Linux_x86_64.tar.gz"
    sha256 "8b940b205e70a7b1014f1decb86b40895cbf2b8272c24c371e4f0f7747912f25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.18.0/privateer_Linux_arm64.tar.gz"
    sha256 "258dba5359fbf15dfa3f7a44b887112ffd645fae4c24029520d89488e53ebd19"
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
