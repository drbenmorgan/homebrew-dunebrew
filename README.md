homebrew-dunebrew
=================

Homebrew formulae for DUNE software. Tested on Linuxbrew only, with
Macbrew to come.

To use this tap, first [install Homebrew](https://github.com/Homebrew/homebrew) for Mac, or [install Linuxbrew](https://github.com/Homebrew/linuxbrew), then add the tap:

```sh
$ brew tap drbenmorgan/dunebrew
```

At present only the DUNE stack up to [art](https://github.com/LBNE/fnal-art)
is built. To install this, do

```
$ brew install dune-toolchain
$ brew install art
```

The first installation simply installs the required GCC 4.9 compiler and
associated tools. Once `art` is installed, it can be run simply by
doing

```
$ art --help
```

This tap will be updated as packages develop, and should be considered
unstable at present.
