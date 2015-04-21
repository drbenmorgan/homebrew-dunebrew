class Root < Formula
   homepage "http://root.cern.ch"
   version "5.34.26"
   revision 1
   sha1 "f9013c37c37946b79dce777d731ccb64e5b28bb8"
   url "ftp://root.cern.ch/root/root_v#{version}.source.tar.gz"
   mirror "http://ftp.riken.jp/pub/ROOT/root_v#{version}.source.tar.gz"
   head "https://github.com/root-mirror/root.git", :branch => "v5-34-00-patches"

   # Patches
   patch do
     url "https://raw.githubusercontent.com/drbenmorgan/homebrew-dunebrew/master/root_rpath_patch.diff"
     sha1 "f410316b8c57c1b0b0244801dea8e384a76b8b71"
   end

   patch do
     url "https://raw.githubusercontent.com/drbenmorgan/homebrew-dunebrew/master/root_shared_linker_flags_patch.diff"
     sha1 "5744be6245e0e5d8d78a5807eda06e818782cad8"
   end

   depends_on "cmake" => :build
   depends_on "gsl" => :recommended
   depends_on "openssl"

   option :cxx11
   depends_on "python" => :optional


   def install
     mkdir "hb-build-root" do
       ENV.cxx11 if build.cxx11?

       args = std_cmake_args
       args << "-Dgnuinstall=ON"
       args << "-DCMAKE_INSTALL_SYSCONFDIR=etc/root"
       args << "-Dgminimal=ON"
       args << "-Dcxx11=OFF" unless build.cxx11?
       args << "-Dlibcxx=ON" if OS.mac?
       args << "-Dfortran=OFF"
       args << "-Dpython=OFF" unless build.with? "python"
       args << "-Dmathmore=OFF" unless build.with? "gsl"
       args << "-Drpath=ON"
       args << "-Dsoversion=ON"

       # NB, need to patch RootBuildOptions to set INSTALL RPATH correctly
       # Then probably also need RPATH use link path to find HB libdir
       system "cmake", "../", *args
       system "make"
       system "make", "install"
     end
   end
end
