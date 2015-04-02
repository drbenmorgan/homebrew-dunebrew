homebrew-dunebrew
=================

Homebrew formulae for DUNE software. Tested on Linuxbrew only, with
Macbrew to come.

To use this tap, first [install Homebrew](https://github.com/Homebrew/homebrew) for Mac, or [install Linuxbrew](https://github.com/Homebrew/linuxbrew), and ensure that 
your `PATH` contains the directory holding the `brew` command. This will be the `bin` subdirectory of the directory 
you `git clone`d homebrew into. With this in place, add this tap:

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
associated tools. This has only been tested on SUSE Enterprise Linux 11.2 and Scientific Linux 6.5.
Once `art` is installed, it can be run simply by doing

```
$ art --help
```

This tap will be updated as packages develop, and should be considered
unstable at present.
