# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.0.1.tar.gz"
  sha256 "6b236b678983a64bd4dd70f58eb506faf48ded251a0675e3109281c7fcf81132"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.1/dotty-1.0.1-darwin-amd64.tar.gz"
      sha256 "3126ddd1d837ad3225ea4cafefb11f7ecac312b1a3e1053d4648ca5c2cdb661f"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.1/dotty-1.0.1-darwin-arm64.tar.gz"
      sha256 "8bff806b5360c54498128c2a120f830e7ec87e17a8e94c74b03bacc6310265e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.1/dotty-1.0.1-linux-amd64.tar.gz"
      sha256 "ab331e57637f44ef3566c8d8c4d0be5633c6bed7a22b699a6f9c03c960146ec3"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
