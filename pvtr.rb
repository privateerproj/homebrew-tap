# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.1/privateer_Darwin_all.tar.gz"
    sha256 "3cfcbc851a6699e4404a1fe833494574653fa879f29641330ed534cd4b7391b7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.1/privateer_Linux_x86_64.tar.gz"
    sha256 "25350772421cd1f5d3ea6407f9a493819a30e5ddef9a288a6f7f2532a020d808"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.20.1/privateer_Linux_arm64.tar.gz"
    sha256 "c5abd0a900d8ad49d84a36786f792b10b6b583a7aaae4f8db1845ac43639291d"
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
