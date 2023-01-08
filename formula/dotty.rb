# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/0.1.0.tar.gz"
  sha256 "90e1d3b798ce71d6a8ab98bad4e78a7983800e9fc34f0e75cbf01a375122b7fe"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-darwin-amd64.tar.gz"
      sha256 "c20a1d16698abece049cbfc5057b36006f50f7a333f80076d2e6b2097a2b8975"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-darwin-arm64.tar.gz"
      sha256 "0b5a562fd5a46d3e97404e5549e2ecaf23e4a245cae9273f3a4328d2f939c0b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-linux-amd64.tar.gz"
      sha256 "2acf7227844840a841c1e4089e743429e71f00ddf8303b8db5c6f160f1a5598c"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
