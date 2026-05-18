# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.2/privateer_Darwin_all.tar.gz"
    sha256 "2c0b1b3dc23d991c5e8d2f85aa7dea050dbdb7ba66f4a5e66dc85f6654905761"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.2/privateer_Linux_x86_64.tar.gz"
    sha256 "e2dfd18c6760af829ff9bada6d5951b76b91f6c61d6931d7012a41237aefbfb1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.2/privateer_Linux_arm64.tar.gz"
    sha256 "4904e0d1c55184ebb426852759d9091a44835327d73d9f592ec1be48b41091e4"
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
