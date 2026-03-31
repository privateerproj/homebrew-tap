# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/privateer"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/privateer/releases/download/v0.18.1/privateer_Darwin_all.tar.gz"
    sha256 "86b55fd305d86c0572f40a111530c910bab6c3d140c4b83ef94c0a9dffdfef01"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/privateer/releases/download/v0.18.1/privateer_Linux_x86_64.tar.gz"
    sha256 "2137e9d9b09a6029d5bf534fe1f5e365e353126b91b9d6f6941e87c387b69a11"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/privateer/releases/download/v0.18.1/privateer_Linux_arm64.tar.gz"
    sha256 "f8e7b5af11b19b457146f139a5a8db7e7ffbca9ccf75b67218c95c3ba8ba5ec4"
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
