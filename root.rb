class Root < Formula
   homepage "http://root.cern.ch"
   version "5.34.26"
   sha1 "f9013c37c37946b79dce777d731ccb64e5b28bb8"
   url "ftp://root.cern.ch/root/root_v#{version}.source.tar.gz"
   mirror "http://ftp.riken.jp/pub/ROOT/root_v#{version}.source.tar.gz"
   head "https://github.com/root-mirror/root.git", :branch => "v5-34-00-patches"

   depends_on "cmake" => :build
   depends_on "openssl"
   depends_on "sqlite"
   
   depends_on "gsl" => :recommended

   option :cxx11
   depends_on "python" => :optional


   def install
     mkdir "hb-root-build" do
       #args = %W[
       #  --prefix=#{prefix}
       #  --etcdir=#{prefix}/etc/root
       #  --libdir=#{prefix}/lib
       #  --mandir=#{man}
       #  --with-cc=#{ENV.cc}
       #  --with-cxx=#{ENV.cxx}
       #  --with-f77=/dev/null
       #]

       #args << "--enable-cxx11" if build.cxx11?
       #args << "--enable-libcxx" if OS.mac?
       #args << "--enable-rpath"
       #args << "--enable-soversion"
       #args << "--enable-ssl"
       #args << "--enable-sqlite"
       #args << "--enable-python" if build.with? "python" 
       #args << "--enable-mathmore" if build.with? "gsl"

       #system "../configure", *args

       ENV.cxx11 if build.cxx11?

       args = std_cmake_args
       args << "-DCMAKE_INSTALL_CMAKEDIR=share/root"
       args << "-Dcxx11=ON" if build.cxx11?
       args << "-Dlibcxx=ON" if OS.mac?
       args << "-Dpython=OFF" unless build.with? "python"
       args << "-Dmathmore=OFF" unless build.with? "gsl"
       args << "-Dsoversion=ON"

       system "cmake", "../", *args
       system "make"
       system "make", "install"
     end
   end
end

