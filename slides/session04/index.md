% CLI Operations (Continued)
% SEIE, Soochow University
% Week 04, 2015-2016-1

# Report Q&A

## Overview

* What
* How
* Get Help
* To Help

## Process

* Edit `*.md` sources
    - on local host or remote
* `make` to get output
* `exit` NOT close the window
* Copy `report.pdf` to local host
* Send it

## Online Posts

* Using the same basic Markdown syntax
* For further hard-copy ready

## Markdown commons

* A space between English and Chinese
* Punctuations
* Paragraphs separated by blank line
* Line breaks by 2 spaces or `\` ending
* No indentation
* Indentations and spaces
* Numbered list: `3. blabla` (The space!)

---

    Para1 line1 汉字内容。
    欢迎来到 Suzhou, the end. Another sentence.

    Para2 line1  
    para2 line2
    para2 line3\
    para2 line4

---

Para1 line1 汉字内容。
欢迎来到 Suzhou, the end. Another sentence.

Para2 line1  
para2 line2
para2 line3\
para2 line4

---

## Code blocks

Screen inputs and outputs

* 4 spaces indentation
* Fenced code blocks
    - wrapped within `` ``` `` or `~~~`

---

Source

```
This is a normal paragraph:

    This is a code block.
```

---

Output

This is a normal paragraph:

    This is a code block.

---

Source

    Here's an example:

    ```
    function test() {
      console.log("notice the blank line before this function?");
    }
    ```

---

Output

Here's an example:

```
function test() {
  console.log("notice the blank line before this function?");
}
```

---

## Inline Codes

* Inline codes wrapped within `` ` ``
    ```
    By executing `./run.sh week04 &`, We get ...
    ```
* By executing `./run.sh week04 &`, We get ...

# Grades and Credits

## Scores

> * Lab reports - 45%
> * Community posts - 25%
> * Projects - 20%
> * Overall performance - 10%

## Schedules

* Week 04 ~ 07: Commands operations
* Week 08: Editors Basic (Vi)
* Week 09 ~ 10: Shell scripting programming
* Week 11 ~ 13: Linux C programming basics
* Week 13 through week 17: projects (Full weekends)

# Commands Operations

## Guides

> * Introduction to Linux (edx.org)
> * 鸟哥的 Linux 私房菜
> * Linux Bible
> * Linux Fundamentals
> * 快乐的 Linux 命令行

## Commands Deeper

And related concepts. Week 04 ~ Week 07:

. . .
```
man; info; help; shutdown; halt; poweroff; reboot; which; whereis;
whatis; pwd; cd; ls; tree; ln; <; >; &; |; locate; find; grep; ?; *;
mount; diff; patch; file; cp; rsync; gzip; bzip2; xz; zip; tar; dd; who;
whoami; id; groups; set; env; export; echo; sleep; history; alias;
chmod; passwd; sftp; ssh; scp; smbclient; cat; tac; more; less; sort;
uniq; comm; paste; join; split; fgrep; tr; tee; wc; cut; head; tail;
strings; ps; top; kill; pstree; w; uptime; bg; fg; jobs; at; crontab;
date; time; sync; mkdir; rmdir; rm; mv; rename; nl; od; touch; df; du;
compress; type; unset; unalias; umask; sed; awk; ifconfig; ip addr; ip
route; ping; traceroute; netstat; lynx; wget; curl; lftp;
```
