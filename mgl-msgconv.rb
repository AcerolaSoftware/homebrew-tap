class MglMsgconv < Formula
  desc "Message converter"
  homepage "https://acerola-software.jp/mgl/"
  url "https://acerola-software.jp/mgl-files/mgl-msgconv-1.2.0.tar.gz"
  sha256 "d3054cf0a70a0411b5ad7bbf771c5737a666774a058d434c9bcc52f21251699a"
  license "Zlib"

  depends_on "scons" => :build

  def install
    bin.mkpath
    system "make", "install", "INSTALL_DIR=#{bin}"
    man.mkpath
    system "./manpages.sh", "install", "#{man}"
  end

  test do
    system "mgl-msgconv", "-v"
  end
end
