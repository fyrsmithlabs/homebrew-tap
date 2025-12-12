# typed: false
# frozen_string_literal: true

class Contextd < Formula
  desc "AI context and reasoning engine for Claude Code"
  homepage "https://github.com/fyrsmithlabs/contextd"
  version "0.3.0-rc3"
  license "MIT"

  url "https://github.com/fyrsmithlabs/contextd/archive/refs/tags/v0.3.0-rc3.tar.gz"
  sha256 "fe31c1aaca0da6826a91737102a9d60df0d169310c201412175726ed016b39ee"

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
