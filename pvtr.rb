# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.17.0/privateer_Darwin_all.tar.gz"
    sha256 "3edb5dad1f2ca8c81cc9d356408cd63afc3a303beac684143c7508e3f97daf0b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.17.0/privateer_Linux_x86_64.tar.gz"
    sha256 "39b5b9dccb4cca25897899defb3e3ae6b9e0e5c0dbddaf5a81f40d217bbe4405"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.17.0/privateer_Linux_arm64.tar.gz"
    sha256 "278542cebc650788c6404f8e2abae914b7e62d8ab1e356f0a32ae532cbe656e7"
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
