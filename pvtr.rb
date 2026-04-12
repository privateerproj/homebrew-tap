# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.0/privateer_Darwin_all.tar.gz"
    sha256 "bd532c588fa6f461ee21fcdf5d0f2525bb150f90c474e7321ea9788149079b7b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.0/privateer_Linux_x86_64.tar.gz"
    sha256 "172cc8fba8456c103bfe188d66cf0744824c77280859e18f19d7fee81a0ff086"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.0/privateer_Linux_arm64.tar.gz"
    sha256 "301951c417e464ac20315773cff3982808d16dc5450c632d5048f7a3dbdaded0"
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
