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

   def install
     mkdir "hb-root-build" do
       args = %W[
         --prefix=#{prefix}
         --etcdir=#{prefix}/etc/root
         --libdir=#{prefix}/lib
         --mandir=#{man}
       ]

       args << "--enable-cxx11" if build.cxx11?
       args << "--enable-libcxx" if OS.mac?
       args << "--enable-rpath"
       args << "--enable-soversion"
       args << "--enable-ssl"
       args << "--enable-sqlite"

       args << "--enable-mathmore" if build.with? "gsl"

       system "../configure", *args
       system "make"
       system "make", "install"
     end
   end
end

