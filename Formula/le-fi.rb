class LeFi < Formula
  desc "Send or receive a file across NATs using a Cloudflare Quick Tunnel"
  homepage "https://git.petedoes.it/Hitori/le-fi"
  url "https://git.petedoes.it/Hitori/le-fi/archive/v0.10.0.tar.gz"
  sha256 "8f362a89f92df4593537df996d81bf9907296a3f6057606033d66b69a9b46243" # see README.md in this tap for how to compute it
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
