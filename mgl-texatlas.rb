class MglTexatlas < Formula
  desc "Texture atlas generator"
  homepage "https://acerola-software.jp/mgl/"
  url "https://acerola-software.jp/mgl-files/mgl-texatlas-1.3.0.tar.gz"
  sha256 "d82d44aba18d183af0b69a17406fc720434329281e2cf0b7580e440e0b0eb89c"
  license "Zlib"

  # depends_on "cmake" => :build

  depends_on "scons" => :build
  depends_on "pkg-config" => :build
  depends_on "libpng"
  depends_on "jsoncpp"

  def install
    bin.mkpath
    system "make", "install", "INSTALL_DIR=#{bin}"
    man.mkpath
    system "./manpages.sh", "install", "#{man}"
  end

  test do
    system "mgl-texatlas", "-v"
  end
end
