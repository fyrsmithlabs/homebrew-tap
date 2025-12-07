# typed: false
# frozen_string_literal: true

class Contextd < Formula
  desc "AI context and reasoning engine for Claude Code"
  homepage "https://github.com/fyrsmithlabs/contextd"
  version "0.2.0-rc4"
  license "MIT"

  url "https://github.com/fyrsmithlabs/contextd/archive/refs/tags/v0.2.0-rc4.tar.gz"
  sha256 "c716b9bc7e5cedc14b9d098f4b0fb5b2a247cf96cd841ce5b5bfe2c90d69bf8d"

  depends_on "go" => :build
  depends_on "onnxruntime"

  def install
    ENV["CGO_ENABLED"] = "1"

    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]

    system "go", "build", *std_go_args(ldflags:), "-o", bin/"contextd", "./cmd/contextd"
    system "go", "build", *std_go_args(ldflags:), "-o", bin/"ctxd", "./cmd/ctxd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/contextd --version")
    assert_match version.to_s, shell_output("#{bin}/ctxd --version")
  end
end
