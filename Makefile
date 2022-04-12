ifndef DOCKERCONTAINERVALGRINDDIR
	DOCKERCONTAINERVALGRINDDIR = ~
endif

all: build run

build:
	docker build --tag valgrind-image .

run:
	docker run --tty --interactive --rm --volume `echo $(DOCKERCONTAINERVALGRINDDIR)`:/valgrind/ --name valgrind valgrind-image
