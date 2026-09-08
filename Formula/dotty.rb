# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/1.3.0.tar.gz"
  sha256 "b651c7fbf62c121ec8eb85b8ebb2e9ed4ee2bf9bbcf9e41eec96b96dea586e86"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.3.0/dotty-1.3.0-darwin-amd64.tar.gz"
      sha256 "91e2971b95ea2b9afe5670087f15e0bd7096b70c188c40cec7ef0b9ad96a597c"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/1.3.0/dotty-1.3.0-darwin-arm64.tar.gz"
      sha256 "6bc2fa27f23122bea8317e8e2c719140950bcfca0f90b305f2d9a583df9cc3e4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/1.3.0/dotty-1.3.0-linux-amd64.tar.gz"
      sha256 "f8cbf2f256d5e8581490bf8184d0fa7d73045a2311e7573751270eed14c779c3"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
