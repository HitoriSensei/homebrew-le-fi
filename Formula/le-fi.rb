class LeFi < Formula
  desc "Send or receive a file across NATs using a Cloudflare Quick Tunnel"
  homepage "https://git.piesekpokojowy.uk/Hitori/le-fi"
  url "https://git.petedoes.it/Hitori/le-fi/archive/v0.9.14.tar.gz"
  sha256 "6096d9666613b21596a1d1810c8d83d0ffbb00e32ae74eff12342c504811a05c" # see README.md in this tap for how to compute it
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
