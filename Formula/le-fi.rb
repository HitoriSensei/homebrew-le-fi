class LeFi < Formula
  desc "Send or receive a file across NATs using a Cloudflare Quick Tunnel"
  homepage "https://git.petedoes.it/Hitori/le-fi"
  url "https://git.petedoes.it/Hitori/le-fi/archive/v0.10.1.tar.gz"
  sha256 "daa928fd03abbbf9a547b2a95f8d31dd16a555767552c9a1078969c6decfcea3" # see README.md in this tap for how to compute it
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
