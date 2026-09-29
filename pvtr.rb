# typed: false
# frozen_string_literal: true

class Pvtr < Formula
  desc "Pluggable compliance testing framework"
  homepage "https://github.com/privateerproj/pvtr"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.23.2/pvtr_Darwin_all.tar.gz"
    sha256 "d40bb833ce7b87c6a4e563aba4ec64797553239908cbd70902be6d7e3d07dbe0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.23.2/pvtr_Linux_x86_64.tar.gz"
    sha256 "dae63a6ceffe17af38c1c75a99f0c577a7ed85eb96bfcf7893245b7522b9dd89"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/privateerproj/pvtr/releases/download/v0.23.2/pvtr_Linux_arm64.tar.gz"
    sha256 "4d02ab9ce78471b970fd1cf765f0d49f731a91acda346a01d47ad1ec4b376fab"
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
