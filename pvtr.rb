# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.16.1/privateer_Darwin_all.tar.gz"
    sha256 "363c84891bea0f50fc6fc6af70b0d2a0a1560d32f36104677673026fb425842c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.16.1/privateer_Linux_x86_64.tar.gz"
    sha256 "116770608126381e2d5bdc06cf0ae43452698c81b89ae3536ed838d0d73898ef"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.16.1/privateer_Linux_arm64.tar.gz"
    sha256 "a1e2b3d898b50a9f654c557298f84f6d2e9784a27caec4ae94e1a8d0261919e8"
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
