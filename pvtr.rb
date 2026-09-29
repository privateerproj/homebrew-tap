# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/pvtr"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.24.0/pvtr_Darwin_all.tar.gz"
    sha256 "96ade73e31235a2def66f5f04b0ae999734327b85ab79c233afb2db27467e3b0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.24.0/pvtr_Linux_x86_64.tar.gz"
    sha256 "c8cc23633a842f9214d8c9f149183a5c62e854e2233c7f7cdb4116224f6aa20e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.24.0/pvtr_Linux_arm64.tar.gz"
    sha256 "d0c0b194aaf27f7a5d4226ed8a9a2c507aba91685b9697875a1b3d4601485889"
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
