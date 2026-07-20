# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.22.0/privateer_Darwin_all.tar.gz"
    sha256 "412588ef172f20db240e07a5739c8c39c4cfbf2947cdc599b3c24412903a09d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.22.0/privateer_Linux_x86_64.tar.gz"
    sha256 "01c7989758e407acd533d531632e13112b763e32d67631b33d41a7dcb07ae408"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.22.0/privateer_Linux_arm64.tar.gz"
    sha256 "d87716b677d5a8c721318d9cef324633431a04db3d24307abab412a44a6c0017"
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
