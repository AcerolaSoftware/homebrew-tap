class MglFont2tex < Formula
  desc "Rasterized font generator"
  homepage "https://acerola-software.jp/mgl/"
  url "https://acerola-software.jp/mgl-files/mgl-font2tex-1.4.0.tar.gz"
  sha256 "aa1379243c3fdb7e01b1c907a8cbfad666a31b85162b0378b66deb83caba66fb"
  license "Zlib"

  depends_on "scons" => :build
  depends_on "pkg-config" => :build
  depends_on "libpng"
  depends_on "freetype"
  depends_on "jsoncpp"

  def install
    bin.mkpath
    system "make", "install", "INSTALL_DIR=#{bin}"
    man.mkpath
    system "./makeman.sh", "install", "#{man}"
  end

  test do
    system "mgl-font2tex", "-v"
  end
end
