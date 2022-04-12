# Valgrind on MacOS

## What?

Quoting [valgrind.org](https://valgrind.org/),
> Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail. You can also use Valgrind to build new tools.

Unfortunately, at the moment, Valgrind does not work properly with MacOS. (maybe MacOS doesn't work properly with Valgrind?)

As I always need to check for memory leaks on software I develop, I've come with a solution that allows me to use Valgrind on a Mac, without complicated VMs and stuff like that. A simple Docker container that accesses the actual files from your Mac disk. This way, checking memory on MacOS becomes easy, fast and portable.

## How?
Basically, an Ubuntu **Docker container** with everything you need to compile your code and run valgrind is created when you run the **valgrind** command.

## Files

When the container starts, it's going to be in the `/valgrind` directory (inside the container), which will be acessing the **actual files** from MacOS that are present on the directory from where you executed the **valgrind** command.

## Setup and Usage
Clone the repository to a folder name `Docker` on your user home folder and add this function to your shell configuration file. E.g. `.zshrc` or `.bashrc`
```
function valgrind {
	export DOCKERCONTAINERVALGRINDDIR=`pwd`
	cd /Users/$USER/Docker
	make DIR="$DOCKERCONTAINERVALGRINDDIR"
	cd $DOCKERCONTAINERVALGRINDDIR
	unset DOCKERCONTAINERVALGRINDDIR
}
```

Also, make sure you have **Docker installed on your system** and that it is running.

Then, just run the command `valgrind`.

---

The container comes with `vim`, `clang`, `gcc`, `make` and `valgrind` already installed.
It runs **Ubuntu**.

---

The container also comes with a special alias called `valgrind-flags`. It runs **valgrind** with the following flags:
* `--leak-check=full`
* `--show-leak-kinds=all`
* `--track-origins=yes`

## Usage Example
* `cd MY_PROJECT_DIR` (MacOS)
* `valgrind` (MacOS)
* `make re` (Container) (COMPILE YOUR CODE)
* `valgrind-flags ./executable` (Container)
