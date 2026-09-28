# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.23.1/pvtr_Darwin_all.tar.gz"
    sha256 "a7261965b96b711f7d16d25926c32b2c65fc866f72efda2e9ac4b5c86d6c2405"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.23.1/pvtr_Linux_x86_64.tar.gz"
    sha256 "c7099885fedb65a7c4729b900714f3cdc14223cd8d12c7138b89815deadb4b14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.23.1/pvtr_Linux_arm64.tar.gz"
    sha256 "e70f93d6b7a0ebc5d9d10d711b5b7abba388481a0415dd9a88a88dee4c974a29"
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
