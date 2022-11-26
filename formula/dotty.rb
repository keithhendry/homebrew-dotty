# typed: false
# frozen_string_literal: true

# This file was generated by Homebrew Releaser. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/0.1.0.tar.gz"
  sha256 "ee092b2af3432e248f5a035e27065bf27685d1daa9afd1988c8e6d0a6b734c05"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-darwin-amd64.tar.gz"
      sha256 "5bf8f3e1f83e4ab2cb09e7e941d1db6a8ee24be6d8fe6be361b2c14d305dec03"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-darwin-arm64.tar.gz"
      sha256 "9abf442161289afb5a5478311a4ab3493ffbfb10dc4a1fd55ed1178a1e53a3c2"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
