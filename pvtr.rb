# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.19.0/privateer_Darwin_all.tar.gz"
    sha256 "78303d7eef4bd9732d38ed9131403abb9866ff3d073e68922013617a88c69fae"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.19.0/privateer_Linux_x86_64.tar.gz"
    sha256 "452b32f6e3dc0482f11a25bae9964485bd32ca94edeb08d3582b0c6675c1737b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.19.0/privateer_Linux_arm64.tar.gz"
    sha256 "a3470c66cb616d132adf0b2cbcfc373594d1f9058f62158bfa37d12933278e44"
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
