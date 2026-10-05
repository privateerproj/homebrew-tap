# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/pvtr"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.24.1/pvtr_Darwin_all.tar.gz"
    sha256 "aeb24951fef7b9d1e64686b9c8db7ef7054d6a75e47ce63e32187f9175f9b1fe"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.24.1/pvtr_Linux_x86_64.tar.gz"
    sha256 "26df0bfc3d90362a51f91d231c0d1799f22febea49247ef91f73414bcd77526a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.24.1/pvtr_Linux_arm64.tar.gz"
    sha256 "87643b7c2995f2934bfd31604ba5040f47971b16a8ca715a2ff6e137a69ca2b1"
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
