% CLI Related Concepts
% SEIE, Soochow University
% Week 06, 2015-2016-1

# Basic Operations

## Login and Out

* hostname and pwd
* Local
* Remote via SSH

## Paths

* **Absolute pathname** start with `/`, whole tree
* **Relative pathname** starts from present working directory
* Showcase...
    ![](res/LFS01_ch06_screen19.jpg)\

## Hard and Soft (Symbolic) Links

* filename and inode. File storage == inode
* `ln`
* Hard links: same file with more than one name. (on same partition)
* Soft links: a link point to any file or directory

# Files

## Standard File Streams

Three file streams (descriptors) related excuting commands.

* stdin (0)
* stdout (1)
* stderr (2)

## I/O Redirection

* change stdin to a file: `command < input-file`
* change stdout to a file: `command > output-file`
* change stderr to a file: `command 2> error-file`

## Pipes

* Link stdout of a command to the stdin of another command
* `command1 | command2 | command3`

## Wildcards and Filename Matching

* `?` matches any single character
* `*` matches any string
* `[set]` matches any character in the set. `[adf]`
* `[!set]` matches any characer not in the set.

# Filesystems

## Filesystem Architecture

* `/proc` proc filesystem
* `/home` user home directory under here. `/root` is root's home
* `/bin`, `/usr/bin`, `/usr/local/bin` for commands
* `/sbin`, `/usr/sbin`, `/usr/local/sbin` for administration commands
* `/dev/` contains device nodes

---

* `/var` files changes when running
    - `/var/log` system log files
    - `/var/lib` packages and database files
* `/etc` for system configuration files
* `/boot` for essential files to boot system
* `/lib` libraries for `/bin` and `/sbin`
* More from Filesystem Hierarchy Standard (FHS)

# User Environment

## Accounts

* User info. `/etc/passwd`
* Group info. `/etc/group`
* Unique user ID (uid) and group ID (gid)
* bash maybe customed by `~/.bashrc`

## Environment Variables

* Named quantities have values understood by shell.
* `set`, `env`, `export`, `setenv`
* `echo $SHELL` to show a variable
* `export VARIABLE=value` to export a new variable value

## Some Variables

* `HOME` represents home directory, same as `~`
* `PATH` directories to scanning comands

## Aliases

* Most often placed in `~/.bashrc`
* `alias` to show
* `alias rm='rm -i'`

## File Permissions

* `chown`, `chgrp`, `chmod`
* `ls -l` to show

. . .

```
rwx: rwx: rwx
 u:   g:   o
```

* File ACL (`getfacl` and `setfacl`)
* SELinux, Role Based Access Controls

# Processes

## Process

* An instance of one or more related **tasks (threads)** excuting.
* With isolated addressing space
    - e.g. Addressing global variables in C programs

## Process Types

* Interactive Processes
* Batch Processes
* Daemons
* Threads
* Kernel Threads

## Process Scheduling and States

* Prcoesses are scheduled by a scheduler. sharing time slices according to priority
* running (run queue per core)
* sleep (wait queue when waiting something)
* zombie (is terminating, child process completes but parent process has not asked its state)

## Process and Thread IDs

* Prcoess ID (PID)
* Parent Process ID (PPID)
* Thread ID (TID)
* RUID (real UID) and EUID (Effective EUID)
* RGID and EGID

## Priorities

* priority is set by a nice value or niceness
* Low values have higher priorities

# Next Week

---

> * Network fundamentals
> * Extended Backus-Naur Form (EBNF) 扩展 巴科斯-瑙尔范式(BNF)
> * Regular expression  正则表达式
