class LeFi < Formula
  desc "Send or receive a file across NATs using a Cloudflare Quick Tunnel"
  homepage "https://git.petedoes.it/Hitori/le-fi"
  url "https://git.petedoes.it/Hitori/le-fi/archive/v0.11.0.tar.gz"
  sha256 "7333be44f513250dca080142dc4c944d0055fa2d8fbd13d68bd0a48a8117760a" # see README.md in this tap for how to compute it
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args, "."
  end

  test do
    help_text = shell_output("#{bin}/le-fi --help")
    assert_match "USAGE", help_text
    assert_match "ATTRIBUTION", help_text
  end
end
