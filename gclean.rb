class Gclean < Formula
  desc "CLI for cleaning you os"
  homepage "https://gclean.mage.sh"
  url "https://storage.googleapis.com/gclean/0.0.9/gclean.tar.gz"
  sha256 "2724306df7b60d492dc6a5da257ee49520637e3ffd6719bb1b8b8622a24fa2a0"
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
