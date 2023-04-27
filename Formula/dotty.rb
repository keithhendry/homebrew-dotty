# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.0.2.tar.gz"
  sha256 "928f7766e254e1b68c8b0496f9c8ac969843333a64ac81ae773ad701d7104d55"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.2/dotty-1.0.2-darwin-amd64.tar.gz"
      sha256 "b3d88a62f5a7a0201a4998827fa9f2599850736140cc947cd93ded1cfd6a16eb"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.2/dotty-1.0.2-darwin-arm64.tar.gz"
      sha256 "7a6a8f229ca676893f84cf577595b831dcdcd61b572f6183fd78bbb86c9ccc53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.2/dotty-1.0.2-linux-amd64.tar.gz"
      sha256 "c77951bb16a72a1c12563d59405f16c7dcf2c2134e4688a34b08c5dabf980292"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
