# Valgrind on MacOS

## How?
Basically, an Ubuntu **Docker container** with everything you need to compile your code and run valgrind is created when you run the **valgrind** command.

## Files

When the container starts, it's going to be on the `/valgrind` directory, which will be acessing the **actual files** present on the directory from where you executed the **valgrind** command.

## Setup and Usage
Clone the repository to a folder name `Docker` on your user home folder and add this function to your `.zshrc` or `.bashrc`:
```
function valgrind {
	export DOCKERCONTAINERVALGRINDDIR=`pwd`
	cd /Users/$USER/Docker
	make DIR="$DOCKERCONTAINERVALGRINDDIR"
	cd $DOCKERCONTAINERVALGRINDDIR
	unset DOCKERCONTAINERVALGRINDDIR
}
```

Also, make sure you have Docker installed on your system and that it is running.

Then, just run the command `valgrind`.

---

The container comes with `vim`, `clang`, `gcc`, `make` and `valgrind` already installed.
It runs on **Ubuntu**.

---

The container also comes with a special alias called `valgrind-flags`. It runs **valgrind** with the following flags:
* `--leak-check=full`
* `--show-leak-kinds=all`
* `--track-origins=yes`