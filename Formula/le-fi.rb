class LeFi < Formula
  desc "Send or receive a file across NATs using a Cloudflare Quick Tunnel"
  homepage "https://git.piesekpokojowy.uk/Hitori/le-fi"
  url "http://gitea:3000/Hitori/le-fi/archive/v0.9.11.tar.gz"
  sha256 "76397268745af36bfb3a9824d843a6b07ae71ec3a64e25acab2b57be2f9e024f" # see README.md in this tap for how to compute it
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
