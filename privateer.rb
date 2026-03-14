# typed: false
# frozen_string_literal: true

class Privateer < Formula
  desc "Disabled: use 'pvtr' instead"
  homepage "https://github.com/privateerproj/privateer"
  url "https://github.com/privateerproj/privateer/releases/download/v0.15.1/privateer_Darwin_all.tar.gz"
  sha256 "d2fc300c7b8d71526a44b5142235b385b34ae30c205a812941c7af66e35de30c"
  version "0.15.1"
  license "Apache-2.0"

  disable! date: "2026-03-14", because: "has been renamed to pvtr"
end
