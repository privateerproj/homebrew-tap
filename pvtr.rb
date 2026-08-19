# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.22.1/pvtr_Darwin_all.tar.gz"
    sha256 "aabb4e248bff18bec1e47fae212a46ee8a87b5a6802a424aa7da3fbb17e2068f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.22.1/pvtr_Linux_x86_64.tar.gz"
    sha256 "307db184d9025b39be5e5a9f085a37007e0fddfeedb6817ad7910eea7ef6d08e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.22.1/pvtr_Linux_arm64.tar.gz"
    sha256 "ab4d541ff5bec7671572d170f2d78a8205bf7ded0a768fa9be868a34fadb508c"
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
