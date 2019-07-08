class Gclean < Formula
  desc "CLI for cleaning you os"
  homepage "https://gclean.mage.sh"
  url "https://storage.googleapis.com/gclean/0.0.13/gclean.tar.gz"
  sha256 "55139920f8b428e43c009263e42467a57f1ddcd920f6880f9e440d9502ed2ef4"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/ema93sh/gclean"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"gclean", "-ldflags=-X main.Version=0.0.13", "."
    end
  end

  test do
    assert_match "gclean version 0.0.13", shell_output("#{bin}/gclean -v 2>&1", 0)
  end
end
