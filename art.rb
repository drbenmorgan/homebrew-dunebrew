class Art < Formula
  url "https://github.com/DUNE/fnal-art.git", :branch => "alt-cmake-1.13.01", :revision => "4bcb642fc4"
  version "1.13.1"
  head "https://github.com/DUNE/fnal-art.git", :branch => "develop"

  depends_on "clhep" => "c++11"
  depends_on "cmake" => :build

  depends_on "doxygen" => [:optional, :build]
  option 'with-doxygen', 'Build Doxygen HTML docs'

  depends_on "fnalcore"
  depends_on "gccxml"
  depends_on "root" => ["c++11", "with-python"]
  depends_on "tbb" => ["c++11"]

  def install
    ENV.cxx11
    # Fixup environment for ROOT/PyROOT
    ENV.prepend_path "PYTHONPATH", "#{Formula["root"].lib}/root"

    mkdir "art-build" do
      args = std_cmake_args
      args << "-DCMAKE_INSTALL_LIBDIR=lib"
      args << "-DALT_CMAKE=ON"
      args << "-Dart_BUILD_DOCS=OFF" unless build.with? "doxygen"
      args << "-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON"
      system "cmake", "../", *args
      system "make", "install"
    end
  end
end
