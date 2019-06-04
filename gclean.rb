class Gclean < Formula
  desc "CLI for cleaning you os"
  homepage "https://gclean.mage.sh"
  url "https://storage.googleapis.com/gclean/0.0.7/gclean.tar.gz"
  sha256 "3fbf3a841e8664b0dfda2c4d1a85ca1d1c7503a57994bb717b781e5d580ac20b"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/ema93sh/gclean"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"gclean", "-ldflags=-X main.Version=0.0.7", "."
    end
  end

  test do
    assert_match "gclean version 0.0.7", shell_output("#{bin}/gclean -v 2>&1", 0)
  end
end
