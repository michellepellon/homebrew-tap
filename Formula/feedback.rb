# typed: false
# frozen_string_literal: true

class Feedback < Formula
  desc "A modern TUI podcast client for the terminal"
  homepage "https://github.com/michellepellon/feedback"
  version "0.2.0"
  license "MIT"

  depends_on arch: :arm64

  url "https://github.com/michellepellon/feedback/releases/download/v0.2.0/feedback-arm64-apple-darwin.tar.gz"
  sha256 "b87816903500d75a8cf3114541ef1677fa39d80131b2713d35515655b897beda"

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
