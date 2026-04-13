class Krang < Formula
  desc "TUI task orchestrator for managing multiple Claude Code sessions via tmux"
  homepage "https://github.com/dpetersen/krang"
  url "https://github.com/dpetersen/krang/archive/refs/tags/v1.0.0-beta.2.tar.gz"
  sha256 "3a465ceb4e6ec69ad73b12b1a206dd0b0bb5da971f14c1765456ff98a70df104"
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
