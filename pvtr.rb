# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.1/privateer_Darwin_all.tar.gz"
    sha256 "56fbf99af39181f4f7bd7ce4c6fc029a6a8eae06bb5bd4f79a2d2523b0c4e576"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.1/privateer_Linux_x86_64.tar.gz"
    sha256 "80fb90b90d1b7f5a90f789c250e3b6febbe88f9e0080ed223d78431e086cb4b8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.1/privateer_Linux_arm64.tar.gz"
    sha256 "76c261df835b35967808560c228b753ce7cadc6b74e559efb9519f5f28160f67"
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
