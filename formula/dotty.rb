# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  url "https://github.com/keithhendry/dotty/archive/refs/tags/0.1.0.tar.gz"
  sha256 "3c2bd7c7b1355cf3839efa6c1f032befb839efed846be70279886a6cdcc57fe4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-darwin-amd64.tar.gz"
      sha256 "f0be9eb5b1153d2a1fd419749ea5dc492e76f24c8b7194b95d338d593bfd27fc"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-darwin-arm64.tar.gz"
      sha256 "297f648dc928133be683650e9a275f8e6c9bf1cd56d98c266ece5ee2a7b78a90"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
