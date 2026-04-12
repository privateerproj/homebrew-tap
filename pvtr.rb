# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.2/privateer_Darwin_all.tar.gz"
    sha256 "ce4a2207d86f48441801c9d4956e1557a39f1e8b9579802b9f89721135090a24"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.2/privateer_Linux_x86_64.tar.gz"
    sha256 "5beba747c3875d11e471c7ac07a85e4c791fe504c59cb6f1de0461ee76c83ea7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.2/privateer_Linux_arm64.tar.gz"
    sha256 "aefb0e4e6934ca4d1943c29c49d9937900139e6000cdefbc85e70ed017d505a6"
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
