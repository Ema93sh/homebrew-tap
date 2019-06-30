class Gclean < Formula
  desc "CLI for cleaning you os"
  homepage "https://gclean.mage.sh"
  url "https://storage.googleapis.com/gclean/0.0.11/gclean.tar.gz"
  sha256 "b174cc7a64706dbea3a855841f380e89fb60afbb5cde1c5284b92c57ad2c7b80"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/ema93sh/gclean"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"gclean", "-ldflags=-X main.Version=0.0.11", "."
    end
  end

  test do
    assert_match "gclean version 0.0.11", shell_output("#{bin}/gclean -v 2>&1", 0)
  end
end
