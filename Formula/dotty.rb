# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.1.1.tar.gz"
  sha256 "4b2c058d18d1bad2328ac2ac614f040f8b6b70e687293cf878594a8b498671c3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.1/dotty-1.1.1-darwin-amd64.tar.gz"
      sha256 "5aa58e95b7ab4a7e2761891a2cb451494c26420d62351f534c66df2794ec24a8"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.1/dotty-1.1.1-darwin-arm64.tar.gz"
      sha256 "a08dc45c9bd66529445c9eb368f612b4e1ede2e8a6542dde76fc40384adb4259"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.1.1/dotty-1.1.1-linux-amd64.tar.gz"
      sha256 "5b6331560a20186c6481a33509cd91de1494d0067078bc705cf876d2d5a09726"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
