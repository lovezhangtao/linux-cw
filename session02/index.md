% Linux Structure and GUI
% SEIE, Soochow University
% Week 02, 2015-2016-1

# Linux Structure

## Basics

* Partitions

* Filesystems

* Boot Process

## Partition and Filesystem

* Partition: Logical part of a disk
    - MBR
    - GPT

* Filesystem: Method of storing files
    - FAT32, NTFS, ext4, XFS, ubifs, tmpfs

* Volumes

---

            Windows         Linux
----------  --------        ------
Partition   Simple Volume1  /dev/sda1
Filesystem  NTFS/FAT32      EXT4/XFS...
Mounting    DriverLetter    MountPoint
Path sep.   \\              /
Names       case-insens.    case-sensitive

---

## Filesystem Hierarchy Standard

![Directory Tree](res/chapter03_flowchart_scr05.jpg)

## Boot Process

* BIOS -> MBR
* EFI/UEFI -> EFI partition

---

![Boot Sequence](res/bootsequence.png)

---

![Boot Process](res/chapter03_flowchart_scr15_1.jpg)

---

![Boot Diagram](res/rhce_linux_boot_diagram.png)

## Text-Mode

* Login (getty)
* Shell (sh, bash, tsch, ...)

## X Window System

* Display manager
    - Display management
    - X server
    - Graphical logins
* Desktop environment
    - Session manager
    - Window manager
    - Utilities

# Graphical User Interface (GUI)

## Wellknown Desktop Environments

* GNOME
* KDE
* Xfce
* LXDE
* ...

## Labs

### Now

> * Alternative Apps for Windows
>     - <http://www.linuxalt.com/>
>     - <http://is.gd/qycNuv>
>     - <http://is.gd/taL29E>
