# typed: false
# frozen_string_literal: true

class Contextd < Formula
  desc "AI context and reasoning engine for Claude Code"
  homepage "https://github.com/fyrsmithlabs/contextd"
  version "0.2.0-alpha"
  license "MIT"

  url "https://github.com/fyrsmithlabs/contextd/archive/refs/tags/v0.2.0-alpha.tar.gz"
  sha256 "94beca968d23b780f40e1688f70a5817688952cd40b13dae5c6ab20811b6c28a"

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
