# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.1.0.tar.gz"
  sha256 "1d806ab9e1a7c91f232f0c4c9623b548ad03993ef5000d57a290435c45136546"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.0/dotty-1.1.0-darwin-amd64.tar.gz"
      sha256 "ad3ebe5633e6abeee5db64b2f0d36c414029133251eda97640ed68c98cc56876"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.0/dotty-1.1.0-darwin-arm64.tar.gz"
      sha256 "af9ca63e706a77fbeb3ceffdd892455210c6f73db17c9091300c2ab090321eab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.0/dotty-1.1.0-linux-amd64.tar.gz"
      sha256 "d2ab99e9c368ca41eddcfd275daa8df025bbd8b401dec17911587eceed05283d"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
