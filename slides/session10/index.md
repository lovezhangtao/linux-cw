% Makefile; Version Control using `git`
% SEIE, Soochow University
% Week 11, 2015-2016-1

---

Build automation software

> * make-based tools
> * Build script generation tools
    -   CMake
    -   GNU build system (autotools)
    -   GYP
    -   ...

# `Makefile`

## Ref.

宋劲杉. Linux C 编程一站式学习

> * Makefile 基础

## An Example

> * [main.c](res/main.c)
> * [main.h](res/main.h)
> * [maze.c](res/maze.c)
> * [maze.h](res/maze.h)
> * [stack.c](res/stack.c)
> * [stack.h](res/stack.h)

---

Works but not good.

```
$ gcc main.c stack.c maze.c -o main
```

---

Two-step approach.

```
$ gcc -c main.c
$ gcc -c stack.c
$ gcc -c maze.c
$ gcc main.o stack.o maze.o -o main
```

---

Better practice. Using `Makefile`

[Makefile1](res/Makefile1)

```makefile
main: main.o stack.o maze.o
	gcc main.o stack.o maze.o -o main
	
main.o: main.c main.h stack.h maze.h
	gcc -c main.c
	
stack.o: stack.c stack.h main.h
	gcc -c stack.c
	
maze.o: maze.c maze.h main.h
	gcc -c maze.c
```

Type `make`

## `Makefile` rules

```
target ... : prerequisites ...
	command1 command2 ...
```

---

[Makefile2](res/Makefile2)

```makefile
all: main

main: main.o stack.o maze.o
	gcc main.o stack.o maze.o -o main
	
main.o: main.c main.h stack.h maze.h
	gcc -c main.c
	
stack.o: stack.c stack.h main.h
	gcc -c stack.c
	
maze.o: maze.c maze.h main.h
	gcc -c maze.c

clean:
	@echo "cleanning project"
	-rm main *.o
	@echo "clean completed"

.PHONY: clean
```

---

```makefile
main.o: main.h stack.h maze.h
main.o: main.c
	gcc -c main.c
```

---

[Makefile3](res/Makefile3)

```makefile
all: main

main: main.o stack.o maze.o
	gcc main.o stack.o maze.o -o main
	
main.o: main.h stack.h maze.h
stack.o: stack.h main.h
maze.o: maze.h main.h

clean:
	-$(RM) main *.o

.PHONY: clean
```

## Implicit Rules

`make -p` to show.

```makefile
LINK.o = $(CC) $(LDFLAGS) $(TARGET_ARCH)

OUTPUT_OPTION = -o $@

CC = cc

LD = ld

COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c

%.o: %.c
	$(COMPILE.c) $(OUTPUT_OPTION) $<
```

`%.o: %.c` Pattern Rule

---

Multiple target. prerequisites centric rules.

```makefile
all: main

main: main.o stack.o maze.o
	gcc main.o stack.o maze.o -o main
	
main.o stack.o maze.o: main.h
main.o maze.o: maze.h
main.o stack.o: stack.h

clean:
	-$(RM) main *.o

.PHONY: clean
```

## Variables

Define using `= := += ?=`

> * `$@` the target
> * `$<` the first prerequisite
> * `$?` updated prerequisites
> * `$^` all prerequisites

---

Variables used by implicit rules.

```makefile
CC = cc
CFLAGS = 
CPPFLAGS = 
LD = ld
LDFLAGS = 
TARGET_ARCH = 
OUTPUT_OPTION = -o $@
LINK.o = $(CC) $(LDFLAGS) $(TARGET_ARCH)
COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
RM = rm -f
```

---

[Makefile](res/Makefile) Using variables.

```makefile
MAINTARGET := main
SOURCE := main.c stack.c maze.c
OBJS := ${SOURCE:.c=.o}

all: $(MAINTARGET)

$(MAINTARGET): $(OBJS)
	$(LINK.o) $^ $(OUTPUT_OPTION)

clean:
	-$(RM) $(MAINTARGET) $(OBJS)

.PHONY: clean
	
main.o stack.o maze.o: main.h
main.o maze.o: maze.h
main.o stack.o: stack.h
```

## `make` options

*   `-n` just print, no run
*   `-C dir` Change to directory dir before anything else.
*   `make CFLAGS+=-g` define variables

---

`diff` and `patch`

    $ diff -u mmm.c maze.c
    $ diff -u mmm.c maze.c > pp.patch
    $ patch -b < pp.patch

# Version Control with `git`

## Why Version Control

Popular version control systems.

> * CVS
> * subversion (svn)
> * mercurial (hg)
> * git
> * ...

## Learning

> * [版本控制入门插图教程](http://www.ruanyifeng.com/blog/2008/12/a_visual_guide_to_version_control.html)
> * [猴子都能懂的 GIT 入门](http://backlogtool.com/git-guide/cn/intro/intro1_1.html)
> * [Pro git 中文版 (第二版)](https://git-scm.com/book/zh/v2)

## `git` - the simple guide

`git` commands

```
* init  * status    * diff
* add   * commit    * log
* tag   * checkout  * branch
* merge * clone     * fetch
* pull  * push      * remote
```

---

just a simple guide for getting started with git. no deep shit ;)

[git - the simple guide](https://rogerdudler.github.io/git-guide/)
