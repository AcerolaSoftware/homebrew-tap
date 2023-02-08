# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class MglFont2tex < Formula
  desc "Rasterized font generator"
  homepage "https://acerola-software.jp/mgl/"
  url "https://acerola-software.jp/mgl-files/mgl-font2tex-1.3.0.tar.gz"
  sha256 "abbf8f7920fdbf171b3d4dce5b82ca3f94eba2584d7dcec0320eb76261c13220"
  license "Zlib"

  # depends_on "cmake" => :build

  depends_on "scons" => :build
  depends_on "pkg-config" => :build
  depends_on "libpng"
  depends_on "freetype"
  depends_on "jsoncpp"

  def install
    bin.mkpath
    system "make", "install", "INSTALL_DIR=#{bin}"
    man.mkpath
    system "./manpages.sh", "install", "#{man}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test mgl-font2tex`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "mgl-font2tex", "-v"
  end
end
