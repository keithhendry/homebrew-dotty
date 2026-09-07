# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.2.0.tar.gz"
  sha256 "ce3eef287b8ff1b5505a7259b02c313877a45b15f9ec449b023833bd4d2f2bf1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.2.0/dotty-1.2.0-darwin-amd64.tar.gz"
      sha256 "a7037f53d9310ede5322ed45a0256937aa6b073cf06e8b22d51dee8b1406f84a"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.2.0/dotty-1.2.0-darwin-arm64.tar.gz"
      sha256 "97a0200bc3074c04ed6084798c4d4cedd800749b51aa70349558e89d84ad0623"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.2.0/dotty-1.2.0-linux-amd64.tar.gz"
      sha256 "6c8dfd28d1b3aca17d4faa0509b34d2c81a41818cd11edbdc1dbe0ecde14f8ac"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
