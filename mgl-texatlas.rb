class MglTexatlas < Formula
  desc "Texture atlas generator"
  homepage "https://acerola-software.jp/mgl/"
  url "https://acerola-software.jp/mgl-files/mgl-texatlas-1.3.0.tar.gz"
  sha256 "358b29da635ea52b3cb5f32f42c2cd8384c6f5e4bd04219490fca9215600ca16"
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
