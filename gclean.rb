class Gclean < Formula
  desc "CLI for cleaning you os"
  homepage "https://gclean.mage.sh"
  url "https://storage.googleapis.com/gclean/0.0.8/gclean.tar.gz"
  sha256 "918705d88a692c59d1e1a0f5fa1f02fdc964edcaf76a7ecafc2781f997cb552e"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/ema93sh/gclean"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"gclean", "-ldflags=-X main.Version=0.0.8", "."
    end
  end

  test do
    assert_match "gclean version 0.0.8", shell_output("#{bin}/gclean -v 2>&1", 0)
  end
end
