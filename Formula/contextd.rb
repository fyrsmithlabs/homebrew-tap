# typed: false
# frozen_string_literal: true

class Contextd < Formula
  desc "AI context and reasoning engine for Claude Code"
  homepage "https://github.com/fyrsmithlabs/contextd"
  version "0.2.0-alpha"
  license "MIT"

  depends_on "onnxruntime"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fyrsmithlabs/contextd/releases/download/v0.2.0-alpha/contextd_0.2.0-alpha_darwin_amd64.tar.gz"
      sha256 "9a1ee9a4ad456d7a5b608f426020331306cfeaafb17c4edc88ba8a842178bddb"

      def install
        bin.install "contextd"
        bin.install "ctxd"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/fyrsmithlabs/contextd/releases/download/v0.2.0-alpha/contextd_0.2.0-alpha_darwin_arm64.tar.gz"
      sha256 "7a362e65628c5d4c4776dcce1999749306bcaefd682923d2405edc7aaee50acc"

      def install
        bin.install "contextd"
        bin.install "ctxd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/fyrsmithlabs/contextd/releases/download/v0.2.0-alpha/contextd_0.2.0-alpha_linux_amd64.tar.gz"
      sha256 "5011db9a61f3a05b22abad9ed6cb0be4799bdc2022d8416c57c74535b790360e"

      def install
        bin.install "contextd"
        bin.install "ctxd"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fyrsmithlabs/contextd/releases/download/v0.2.0-alpha/contextd_0.2.0-alpha_linux_arm64.tar.gz"
      sha256 "fb04af6333d5904d643c25541fbcea2c96e305a96a63aa9a35349f215bb750da"

      def install
        bin.install "contextd"
        bin.install "ctxd"
      end
    end
  end

  test do
    system "#{bin}/contextd", "--help"
    system "#{bin}/ctxd", "--help"
  end
end
