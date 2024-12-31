# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.1.2.tar.gz"
  version "1.1.2"
  sha256 "e452817fee27e579a5bcc631678e8f2d3a2a7eb734d0346b6c98f40a744efbca"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.2/dotty-1.1.2-darwin-amd64.tar.gz"
      sha256 "5fe9b8b2f3172f209ad76a3dc50247bd4a2cfbcf238d220b853005ad121091ed"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.2/dotty-1.1.2-darwin-arm64.tar.gz"
      sha256 "25211666084caaf5914041b7bc9fa58f883d24cedc49d0803fb47c7baad3d2fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.2/dotty-1.1.2-linux-amd64.tar.gz"
      sha256 "7cdba9bf69165e659042055389db6289c46dc4b821fec6e08908e47ad52cb0ee"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
