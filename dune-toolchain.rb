class DuneToolchain < Formula
  # This is a hack - purely to get homebrew to do something
  # Later will have actual software for stack management
  url File.dirname(__FILE__), :using => :git
  version "1.0.0"

  # Could wrap in OS detection once the higher up FNAL
  # software is no longer GCC-locked
  depends_on "pkg-config"
  depends_on "gcc"
  depends_on "patchelf"
  depends_on "binutils"
  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"

  # Use explicit python dep rather than ':python'
  # because latter gets built *before* gcc if
  # not satisfied
  depends_on "python"

  # Vendor our own CMake and gccxml
  depends_on "drbenmorgan/dunebrew/cmake"
  depends_on "drbenmorgan/dunebrew/gccxml"

  def install
    bin.mkdir
    touch "#{bin}/dune-buildtools"
  end
end
