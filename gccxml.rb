require "formula"

class Gccxml < Formula
  url "https://github.com/gccxml/gccxml.git", :commit => "ab651a2aa866351bdd089a4bf1d57f6a9bec2a66"
  version "0.9.0"

  patch do
    url "https://raw.githubusercontent.com/DUNE/lbne-build/master/patches/lbne/gccxml-0_9_20140718.patch"
    sha256 "a2a7e7735e98a90a886a0794ca627a3e10a3a491b875e10a4ea4c2ee30588968"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", *std_cmake_args
    system "make", "install"
  end
end
