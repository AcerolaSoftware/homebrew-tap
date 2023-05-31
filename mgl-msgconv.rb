class MglMsgconv < Formula
  desc "Message converter"
  homepage "https://acerola-software.jp/mgl/"
  url "https://acerola-software.jp/mgl-files/mgl-msgconv-1.3.0.tar.gz"
  sha256 "7f3c5e0bf30dbb6030aaa32a7c890f13ef83ccc0aab9e4d166de515fd9039746"
  license "Zlib"

  depends_on "scons" => :build
  depends_on "pkg-config" => :build
  depends_on "jsoncpp"

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
