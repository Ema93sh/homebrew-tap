class Gclean < Formula
  desc "CLI for cleaning you os"
  homepage "https://gclean.mage.sh"
  url "https://storage.googleapis.com/gclean/0.0.9/gclean.tar.gz"
  sha256 "dbe0184bef848bb196e94ab90289ce82b316089479486516be3fa84dc64dde42"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/ema93sh/gclean"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"gclean", "-ldflags=-X main.Version=0.0.9", "."
    end
  end

  test do
    assert_match "gclean version 0.0.9", shell_output("#{bin}/gclean -v 2>&1", 0)
  end
end
