require "formula"

class Fnalcore < Formula
  url "https://github.com/LBNE/FNALCore.git", :branch => "develop", :revision => "e1df99344d"
  version "1.13.1"
  head "https://github.com/LBNE/FNALCore.git", :branch => "develop"
  
  depends_on "cmake" => :build

  depends_on "doxygen" => [:optional, :build]
  option 'with-doxygen', 'Install FNALCore HTML docs'

  depends_on "boost" => "c++11"
  depends_on "sqlite"

  def install
    ENV.cxx11
    args = std_cmake_args
    args << "-DCMAKE_PREFIX_PATH=#{prefix}"
    args << "-DCMAKE_INSTALL_RPATH=#{lib}"
    args << "-DCMAKE_INSTALL_LIBDIR=lib"
    args << "-DFNALCore_BUILD_DOCS=OFF" if build.without? "doxygen" 
    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test FNALCore`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
