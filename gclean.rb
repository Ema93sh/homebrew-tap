class Gclean < Formula
  desc "CLI for cleaning you os"
  homepage "https://gclean.mage.sh"
  url "https://storage.googleapis.com/gclean/0.0.10/gclean.tar.gz"
  sha256 "69a22dc727af5d4dad845d167eed633c680dce83721fd14be15ab6a6d803a263"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/ema93sh/gclean"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"gclean", "-ldflags=-X main.Version=0.0.10", "."
    end
  end

  test do
    assert_match "gclean version 0.0.10", shell_output("#{bin}/gclean -v 2>&1", 0)
  end
end
