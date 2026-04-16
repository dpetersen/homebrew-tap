class Krang < Formula
  desc "TUI task orchestrator for managing multiple Claude Code sessions via tmux"
  homepage "https://github.com/dpetersen/krang"
  url "https://github.com/dpetersen/krang/archive/refs/tags/v1.0.0-beta.3.tar.gz"
  sha256 "8388902ae60d7e7a6341ce7bc13ea866a4ecb0272f1070f7f90d6d0befd6a270"
  license "MIT"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    ldflags = %W[
      -s -w
      -X github.com/dpetersen/krang/cmd.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/krang --version")
  end
end
