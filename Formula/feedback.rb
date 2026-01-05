# typed: false
# frozen_string_literal: true

class Feedback < Formula
  include Language::Python::Virtualenv

  desc "A modern TUI podcast client for the terminal"
  homepage "https://github.com/michellepellon/feedback"
  url "https://github.com/michellepellon/feedback/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"
  head "https://github.com/michellepellon/feedback.git", branch: "main"

  depends_on "python@3.12"

  # VLC is optional but recommended for audio playback
  depends_on "libvlc" => :optional

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--no-deps", "."
    system libexec/"bin/pip", "install", "."
    bin.install_symlink libexec/"bin/feedback"
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
    assert_match "feedback", shell_output("#{bin}/feedback --help", 2)
  end
end
