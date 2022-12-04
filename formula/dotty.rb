# typed: false
# frozen_string_literal: true

# This file was generated. DO NOT EDIT.
class Dotty < Formula
  desc "Dotfiles using symlinks and embedded git"
  homepage "https://github.com/keithhendry/dotty"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-darwin-amd64.tar.gz"
      sha256 "914bd58dc9698688bcd1dd4e8c8bb45a19f6a7153d134d7b1e79eb2b86a2bae2"
    end

    on_arm do
      url "https://github.com/keithhendry/dotty/releases/download/0.1.0/dotty-0.1.0-darwin-arm64.tar.gz"
      sha256 "8e135ffe1cbe4d1182c6f26f92b9d768103c9714213afe7cb4848943d60c9923"
    end
  end

  def install
    bin.install "dotty"
  end

  test do
    system "#{bin}/dotty", "--version"
  end
end
