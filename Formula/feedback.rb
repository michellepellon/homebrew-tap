# typed: false
# frozen_string_literal: true

class Feedback < Formula
  desc "A modern TUI podcast client for the terminal"
  homepage "https://github.com/michellepellon/feedback"
  version "0.2.1"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/michellepellon/feedback/releases/download/v0.2.1/feedback-arm64-apple-darwin.tar.gz"
  sha256 "a5ee0caf61aa8e0579a0eb51f5e0a7c3d7a7ae262571df631c92e5125375fda4"

  def install
    bin.install "feedback"
  end

  def caveats
    <<~EOS
      feedback requires either VLC or mpv for audio playback.
      Install one of them:
        brew install vlc
        # or
        brew install mpv
    EOS
  end

  test do
    assert_match "feedback", shell_output("\#{bin}/feedback --help", 2)
  end
end
