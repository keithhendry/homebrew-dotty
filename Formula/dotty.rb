# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.1.3.tar.gz"
  version "1.1.3"
  sha256 "0f1b366820b93a79a2f85871692c8865368c827d86654eebe798140f0f8a5c19"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.3/dotty-1.1.3-darwin-amd64.tar.gz"
      sha256 "e290f3b6834cf40db02fbd4fe71b6ee013bcb301cb68b3e41217ec1626932744"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.3/dotty-1.1.3-darwin-arm64.tar.gz"
      sha256 "9c66b0b8d03c9e66746d8b0622720b0307d295de90723472d897957be74ff62e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.3/dotty-1.1.3-linux-amd64.tar.gz"
      sha256 "3066053d02d87d7caed1d17d428c99fb7729bb8e4dba663ce0ac7e5db2f49492"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
