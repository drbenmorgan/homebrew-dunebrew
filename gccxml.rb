require "formula"

class Gccxml < Formula
  url "https://github.com/gccxml/gccxml.git", :commit => "ab651a2aa866351bdd089a4bf1d57f6a9bec2a66"
  version "0.9.0"

  depends_on "cmake" => :build

  def install
    system "cmake", *std_cmake_args
    system "make", "install"
  end
end
