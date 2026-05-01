# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.0/privateer_Darwin_all.tar.gz"
    sha256 "fdde7acd9fa4c5d9df378456436eba16a365e6f8d4d9967aa9e111a4f04fc178"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.0/privateer_Linux_x86_64.tar.gz"
    sha256 "42d53f2d03ee26e87ef12fba953e399bb9f23fdfb6f3231a3235d9becdc02726"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.21.0/privateer_Linux_arm64.tar.gz"
    sha256 "68d9e648f0293d0233f744174f85e9b13a9ef2016f827e74875e5f1cf76bc039"
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
