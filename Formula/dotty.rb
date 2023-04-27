# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.0.0.tar.gz"
  sha256 "5cc8f600d33db9afcd6a2620e08af140e9fd4d6eb607a7c1e23b70ce98d5bc03"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.0/dotty-1.0.0-darwin-amd64.tar.gz"
      sha256 "b50e32df1962c3e477e483fd1d05682cfa6906613ea79af3cbfeac7f6a238490"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.0/dotty-1.0.0-darwin-arm64.tar.gz"
      sha256 "ac40fe2f3c024b574e33ecdc39b006608fa5a0819c1dbd41157c56211a5d1fd7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.0.0/dotty-1.0.0-linux-amd64.tar.gz"
      sha256 "ab75488e39aecccb87f71f7c5ee4d8a6b3a65aea8d2520ea35c083fcc347540a"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
