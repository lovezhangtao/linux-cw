% Video Capture and Cross Compile
% SEIE, Soochow University
% Week 12, 2015-2016-1

# Reports

## Labs

9 reports. Continuously refine them.\
`/home/EE/go/labs`

```
01 +++++++--
02 ++++++---
03 +++++++--
04 +++++++--
05 ++++++---
06 +++++++--
07 ++-------
08 ++-------
10 ++++++---
11 +++++++--
12 +++++++--
13 +++++++--
14 +++++----
15 +++++++--
16 +++++++--
18 +++++++--
19 +++++++--
20 +++++++--
21 +++++----
22 +++++++--
24 +++------
25 +++++++--
26 +++++++--
27 +++++----
28 +++++++--
29 +++++++--
30 ++-------
31 ++++++---
```

## Posts

At least 13 posts. Better than better, more and more.\
`/home/EE/go/posts`

```
01 +++++++------
02 +++++++------
03 +++++++------
04 +++++++------
05 +++++++------
06 +++++++------
07 ++-----------
08 -------------
10 +++++++------
11 +++++++------
12 +++++++------
13 +++++--------
14 -------------
15 +++++++------
16 +++++++------
18 +++++--------
19 ++++++-------
20 +++++++------
21 -------------
22 +++++++------
24 ++-----------
25 ++++++-------
26 +++++++------
27 ++++---------
28 +++++++------
29 +++++++------
30 ++++---------
31 ++++++-------
```

## Project

> * Dec. 6 \~ Jan. 26. Print: Jan. 27
> * Collecting materials
> * Prepare your manuscript
> * Main body: 6\~8+ pages
> * Temples is at `/home/EE/go/project?`
> * Appendixes named `appendix??.md`
> * References listed in `references.bib`
> * `make PRINT=y` for print-ready.

# Image Capture

---

Video for Linux Two (V4L2)

![V4l2 Framework](res/V4L2.png)

---

![User space flow](res/flows.bmp)

---

![Buffer queue swap](res/bufferq.jpg)

---

![Detailed process](res/flow.jpg)

## References

> * [grabbing JPEGs from V4L2 devices](https://github.com/twam/v4l2grab)
> * [Video Grabber example](http://linuxtv.org/downloads/v4l-dvb-apis/v4l2grab-example.html)
> * [Video Capture Example](http://linuxtv.org/downloads/v4l-dvb-apis/capture-example.html)
> * [JoyCar Project](https://github.com/joeshang/joycar)
> * [CAPTURING A WEBCAM STREAM USING V4L2](http://jwhsmith.net/2014/12/capturing-a-webcam-stream-using-v4l2/)

---

> * Required packages: `build-essential`, `git`, `libv4l-dev`, `libsdl2-image-dev`
> * Optional: `imagemagick`, `vlc`

## Dive in

```
$ git clone user@go.iee.io:/home/EE/go/v4l2grab
$ git log
$ git checkout ...
```

# Embedded Development Toolchains

---

![Native vs Cross toolchains](res/crossbuild.png)

---

![Native vs Cross toolchains](res/toolchain_definintion.jpg)

---

![Native vs Cross toolchains](res/cross_compile.png)

---

![Native vs Cross toolchains](res/cross-gcc-sandwich.png)

## Showcase

`file` to show file type

`arm-linux-gnueabihf-gcc`

`--sysroot=DIR` option.

```makefile
CROSS_COMPILE=arm-linux-gnueabihf-
CC = $(CROSS_COMPILE)gcc
ifdef SYSROOT
    CFLAGS += --sysroot=$(SYSROOT)
    LDFLAGS += --sysroot=$(SYSROOT)
endif
```
