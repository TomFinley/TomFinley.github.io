---
layout: page
title: Python & BLAS/LAPACK on Broken Linux
date: 2007-01-07
---

This document describes a procedure for setting up Python so that it is able to
call LAPACK routines, on a Linux distribution with broken existing BLAS and
LAPACK dynamic libraries, all from the point of view of a non-administrative
user.

Why might you care about this document? In a nutshell: You might care about this
document if you wish to dynamically load the BLAS or LAPACK libraries in Linux,
and you have one of the many distributions of Linux appear to ship with broken
shared BLAS and LAPACK libraries.

I use Python a lot, and I had desires I'd thought would be easy to satisfy:
calling LAPACK routines from Python. On a properly configured machine, this
would normally be a straightforward matter. For example, consider the following
call to the BLAS function `ISAMAX` from Python, which will work out-of-the-box
on Mac OS X 10.5 if you just paste this code into your Python interpreter:

```python
from ctypes import *
blaslib = cdll.LoadLibrary('libblas.dylib')
array = (c_float*4)()
array[:] = [4.0, 3.14159, 4.1, 2.0]
print blaslib.isamax_(byref(c_int(len(array))), array, byref(c_int(1)))
```

This code will dutifully print out that `3` is the index of the maximum element.
(Recall that Fortran indexes arrays from 1, not 0, unlike Python and C.) (If you
want to try this on Linux, replace the `dylib` in the string with `so`.) LAPACK
routines are, naturally, more complicated, but the calling convention is quite
similar, except there are usually a *lot* more arguments.

Unfortunately, on our department Linux machines, this did not work. I've
observed that many common distributions of Linux ship with broken version of
BLAS and LAPACK dynamic libraries unsuitable for dynamic loading, since whomever
decided to build the libraries neglected to compile with an `-fPIC` flag.
Somehow, this mistake was repeated or else copied in many common Linux
distributions. Also unfortunately, being a non-admin user of department machines
means I have to build my own since the admins, for their own perfectly valid
reasons, are unwilling to do changes to basic libraries outside of their general
maintenance schedule.

Getting to the point of having completely broken libraries to having the ability
to call LAPACK routines from Python was sufficiently non-trivial that I felt
motivated to document my efforts, especially after the second and third times I
had to perform the procedure.

# Instructions

As an overview, these instructions follow this general plan: you will create an
installation hierarchy in your user directory, and then into it you shall
install Python, F2C, BLAS and LAPACK, then NumPy. For those with very peculiar
needs, the installation of SVM<sup>*python*</sup> is also included.

## User Local

Set up your own special "user local" directory structure. This is so that you
can have your own libraries, headers, etc., without administrative privileges on
the machine. Just make the directory `local` in your home directory.

```bash
mkdir ~/local
```

Then you'll want to add the `~/local/bin` and `~/local/lib` directories to your
paths. In Bash this might look something like the following appended to
`~/.bash_profile`.

```bash
export PATH=$HOME/local/bin:$PATH
export LIBRARY_PATH=$HOME/local/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export MANPATH=$HOME/local/man:$MANPATH
```

Then your can source the file you changed, or just relogin, or what have you.
Note that the directories do not exist yet, but should once you install Python.

## Python

Download the Python source. You will probably want [the most recent
version][python-dl] rather than 2.5.1 assuming you're reading this significantly
after these instructions have been written, but these instructions just install
Python 2.5.1. These directions assume you are using at least Python 2.5 for the
[`ctypes`][python-ctypes] module.

```bash
wget http://www.python.org/ftp/python/2.5.1/Python-2.5.1.tgz
tar -zxf Python-2.5.1.tgz
cd Python-2.5.1
```

Next you want to configure, being careful to specify that you want your `~/local` directory as the installation prefix.

```bash
./configure --prefix=$HOME/local
```

Then, just make and install Python. This should create the
`~/local/[lib,include,man,bin]` directories, along with some associated content,
including the Python executable, libraries, includes for C-language extension
modules, and other such things.

```bash
make install
```

Under `csh` or `tcsh`, once it is installed, `rehash` to gain access to that
executable. Then confirm that `which python` points to the `python` executable
in your binary directory (e.g., `/home/yourname/local/bin/python`).

## F2C

First see if there is a `libf2c.so` in your library search path, e.g., a file
exists called `/usr/lib/libf2c.so` in a typical configuration. If it is there,
you can probably skip this step. If this is not there, then you should install
it in your `~/local` structure! First, download and unpack the source.

```bash
wget http://www.netlib.org/f2c/libf2c.zip
unzip libf2c.zip
cp libf2c
```

Then, we have to configure the package, which unfortunately must be done
manually. The start of this process is to copy over the Unix `Makefile` template
to the appropriate location.

```bash
cp makefile.u Makefile
```

Next, we have to do a little tweaking to some of the files so that it builds
properly.

1. Edit `Makefile` and add `-fPIC` to the `CFLAGS` (so that `CFLAGS = -O`
   becomes `CFLAGS = -O -fPIC`).

   * Original

     ```make
     CFLAGS = -O
     ```

   * Changed

     ```make
     CFLAGS = -O -fPIC
     ```

2. We also need to provide a dummy `MAIN__` method, or else links to the dynamic
   library will fail. So, edit `main.c`, and right after line 54, add the
   following dummy function definition: `int MAIN__(void) { return 0; }`. This
   should provide a change like this:

   * Original

     ```c
     #ifdef KR_headers
     extern VOID f_init(), sig_die();
     extern int MAIN__();
     #define Int /* int */
     #else
     extern void f_init(void), sig_die(char*, int);
     extern int MAIN__(void);
     #define Int int
     #endif
     ```

   * Changed

     ```c
     #ifdef KR_headers
     extern VOID f_init(), sig_die();
     extern int MAIN__();
     #define Int /* int */
     #else
     extern void f_init(void), sig_die(char*, int);
     extern int MAIN__(void);
     #define Int int
     #endif
     int MAIN__(void) { return 0; }
     ```

Finally, we can make the package. We first make and copy over the `f2c.h`
header to the include directory, then we make and copy over the `libf2c.so` to
the library directory.

```bash
make hadd
cp f2c.h ~/local/include
make
make libf2c.so
cp libf2c.so ~/local/lib
```

> **Checkpoint:** Start up your newly built Python interpreter and
> copy-and-paste this code in. This will link to your new `libf2c.so` library
> and attempt to call an included function. You should get 1.0 (or something
> pretty close to 1.0) as your final value.
>
> ```python
> from ctypes import *
> f2clib = cdll.LoadLibrary('libf2c.so')
> f2clib.r_cos.restype, f2clib.r_sin.restype = c_double, c_double
> val = c_float(0.8)
> print f2clib.r_cos(byref(val))**2 + f2clib.r_sin(byref(val))**2
> ```

## BLAS and LAPACK

It is now time to build the [BLAS and LAPACK][lapack] shared libraries. Right
out of the box (more or less), these libraries shall (probably) build
*statically*, but the shared dynamic libraries are another story. We need the
shared libraries. (I am not going to use [ATLAS][atlas], but I have no good
reason not to, except that that's just what I got working.) Invaluable to this
effort was [this thread][thread], which, while insufficient by itself, at least
got me on the right track.

The first step is to acquire and unpack the source, and move into the main
directory for the package.

```bash
wget http://www.netlib.org/lapack/lapack.tgz
tar -zxf lapack.tgz
cd lapack-3.1.1
```

The second step is to create the `make.inc` file. This is done by copying over
the included `make.inc.example`, file. The `make.inc` file is included in many
of the makefiles of the code, and is used in this source as the dumping ground
for declarations common to all the build processes.

```bash
cp make.inc.example make.inc
```

We are going to change it so that we are using the `-fPIC` (position-independent
code) option, so that the code may be linked into an already running process
(like, hypothetically, a Python interpreter running a script that decides to
load a module that links to this library we shall build 😉). So edit `make.inc`,
add `-fPIC` to both the `OPTS` and `NOOPT` variables, and just for kicks add a
new `MYLIBDIR = $(HOME)/local` declaration. The original versus new relevant
section of the file should lok like this:

* Original
  ```make
  FORTRAN  = g77
  OPTS     = -funroll-all-loops -O3
  DRVOPTS  = $(OPTS)
  NOOPT    =
  LOADER   = g77
  LOADOPTS =
  ```

* Changed

  ```make
  FORTRAN  = g77
  OPTS     = -funroll-all-loops -O3 -fPIC
  DRVOPTS  = $(OPTS)
  NOOPT    = -fPIC
  LOADER   = g77
  LOADOPTS =
  MYLIBDIR = $(HOME)/local
  ```

### Making BLAS

Now we are going to edit `BLAS/SRC/Makefile` to include a target for the shared
library file `libblas.so`. This requires changing the file in two places: adding
`libblas.so` to the `all` rule, and adding a rule for the `libblas.so` target
after the `$(BLASLIB)` target as seen here.

* Original

  ```make
  all: $(BLASLIB)
  $(BLASLIB): $(ALLOBJ)
  	$(ARCH) $(ARCHFLAGS) $@ $(ALLOBJ)
  	$(RANLIB) $@
  ```

* Changed

  ```make
  all: $(BLASLIB) libblas.so
  $(BLASLIB): $(ALLOBJ)
  	$(ARCH) $(ARCHFLAGS) $@ $(ALLOBJ)
  	$(RANLIB) $@

  libblas.so: $(ALLOBJ)
  	cc -shared -Wl,-soname,$@ -lf2c -o $@ *.o
  	cp $@ $(MYLIBDIR)/$@
  ```

Now, make the library.

```bash
make blaslib
```

If all goes well, you should have a happy, healthy `libblas.so` in your
`~/local/lib` library directory.

> **Checkpoint:** Start up the Python interpreter and copy-and-paste this code
> in.
>
> ```python
> from ctypes import *
> blaslib = cdll.LoadLibrary('libblas.so')
> array = (c_float*4)()
> array[:] = [4.0, 3.14159, 4.1, 2.0]
> print blaslib.isamax_(byref(c_int(len(array))), array, byref(c_int(1)))
> ```
>
> The output should be `3`.

### Making LAPACK

Next we shall make similar changes to the `SRC/Makefile`, by again changing the
file in two places: add `liblapack.so` to the `all` rule, and add a rule for the
`liblapack.so` target after the `../$(LAPACKLIB)` target as seen here. Note the
declaration of the `SO_FILES` variable.

* Original

  ```make
  all: ../$(LAPACKLIB)
  
  ../$(LAPACKLIB): $(ALLOBJ)
  	$(ARCH) $(ARCHFLAGS) $@ $(ALLOBJ)
  	$(RANLIB) $@
  ```

* Changed

  ```make
  all: ../$(LAPACKLIB) liblapack.so
  
  ../$(LAPACKLIB): $(ALLOBJ)
  	$(ARCH) $(ARCHFLAGS) $@ $(ALLOBJ)
  	$(RANLIB) $@
  
  SO_FILES := dlamch slamch
  SO_FILES := $(patsubst %,../INSTALL/%.o,$(SO_FILES))
  liblapack.so: $(ALLOBJ)
  	cc -shared -Wl,-soname,$@ -lblas -o $@ *.o $(SO_FILES)
  	cp $@ $(MYLIBDIR)/$@
  ```

Now, make this library.

```bash
make lapacklib
```

If all goes well, `liblapack.so` should exist in your `~/local/lib` library
directory.

> **Checkpoint:** Start up the Python interpreter and copy-and-paste this code in.
>
> ```python
> from ctypes import *
> lapacklib = cdll.LoadLibrary('liblapack.so')
> n, info = 5, c_int()
> diag, offdiag = (c_double*n)(), (c_double*(n-1))()
> diag[:], offdiag[:] = [2.0]*n, [-1.0]*(n-1)
> r=lapacklib.dsterf_(byref(c_int(n)), diag, offdiag, byref(info))
> print '[', ', '.join('%g'%v for v in diag[:]), ']'
> ```
>
> You should get output like `[ 0.267949, 1, 2, 3, 3.73205 ]`, the eigenvalues
> for this special matrix. This code is using the LAPACK function
> [`DSTERF`][dsterf].

## NumPy

Next we want to get [NumPy][numpy] installed and running. (This is not really
required. However, since installing NumPy is something I often do, I decided to
include it.) However, compared to what we have done so far, this should be quite
easy. First, download and unpack the most recent version of [NumPy][numpy]. Then
run:

```bash
python setup.py install
```

That should be all.

Note, if you want to *just install NumPy* without doing anything else in this
document, and you have a broken dynamic BLAS and LAPACK library that prevents it
from working, then including the following environment variable declarations
should stop NumPy from attempting to link in the bad libraries, and instead
build its own suboptimal-but-still-OK mini-LAPACK:

```bash
export ATLAS=None
export BLAS=None
export LAPACK=None
python setup.py install
```

(Note that in `csh` or `tcsh` instead of `export VARNAME=None` as in `bash`,
you'd use `setenv VARNAME None`.)

Note that in many situations this will suffice, but NumPy uses only the most
general subset of LAPACK, rather insufficient in some calculations where you
know your operands have special structure that can be exploited for speed.
Nonetheless, it is often useful to know how to build NumPy quickly, even under
the typical broken Linux distribution.

## SVM<sup>*python*</sup>

A final completely optional step is to install
[SVM<sup>*python*</sup>][svm-python]. Almost no one but those in my research
group and I will want to do this, but of course as this document is primarily
for my benefit, I'm going to describe it anyway. So there.

First, get and install SVM<sup>*python*</sup>. First go to
[SVM<sup>*python*</sup>'s page][svm-python], download and decompress the archive
for the latest source, and change to the resulting directory. Then build the
executables.

```bash
make
cp svm_python_{learn,classify} ~/bin
```

It is often quite useful to also have the `svmapi` module available for other
purposes, like debugging your scripts in the non-embedded interpreter. If this
is not installed, then `install svmapi` will work only in scripts read from the
`svm_python_learn` and `svm_python_classify` exectuables, which would be
perfectly fine for end users of SVM<sup>*python*</sup>, and most developers.

```bash
cd pyobjs
make install
```

[python-dl]: http://www.python.org/download/
[python-ctypes]: http://docs.python.org/lib/module-ctypes.html
[lapack]: http://www.netlib.org/lapack/
[atlas]:  http://math-atlas.sourceforge.net/
[thread]: https://icl.cs.utk.edu/lapack-forum/viewtopic.php?p=1246
[dsterf]: http://www.netlib.org/lapack/double/dsterf.f
[numpy]: http://numpy.scipy.org/
[svm-python]: https://github.com/TomFinley-archive/SVM-Python
