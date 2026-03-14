# typed: false
# frozen_string_literal: true

class Privateer < Formula
  desc "Deprecated: use 'pvtr' instead"
  homepage "https://github.com/privateerproj/privateer"
  url "https://github.com/privateerproj/privateer/releases/download/v0.15.1/privateer_Linux_x86_64.tar.gz"
  sha256 "8d7b7f397815ff8f80926c98363c0ded97b0381db11f7fd7152917efc4a92def"
  version "0.15.1"
  license "Apache-2.0"

  deprecate! date: "2026-03-14",
             because: "it has been renamed to pvtr. " \
                      "Run: brew uninstall privateer && " \
                      "brew install privateerproj/tap/pvtr"

  def install
    bin.install "privateer"
  end

  test do
    system "#{bin}/privateer", "version"
  end
end
