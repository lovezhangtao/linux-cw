% Basic CLI Operations
% SEIE, Soochow University
% Week 03, 2015-2016-1

# Command Line Interface (CLI)

## Access

* Open a Terminal in Desktop GUI

* Login on Local/Remote Terminal

## Shell

Command interpreter, execute programs

* sh
* bash
* zsh
* csh
* tcsh

## Documents

* `man` pages
    ```
    man man
    ```

* `info`
    - sub-command: `q` `h` `<Enter>` `n` `p` `u`

* `--help` `-h` option

* `help` build-in shell commands

* `/usr/share/doc`

# Remote Access

## Lab host Go

* `ssh -X user@go.iee.io`
* SSH Clients
    - host: go.iee.io
    - Protocol: ssh 2

## Password security

* What you know / What you have
* Strong passwords
* Strongly recommended: 12+
* `passwd`: change password
    - `man passwd` or `info passwd` first

## Free Linux Hosts

Online IDE, More than hosts

> * Koding <https://koding.com/>
> * Cloud9 <https://c9.io/>
> * Codenvy <https://codenvy.com/>
> * Codeanywhere <https://codeanywhere.com/>
> * Nitrous <https://www.nitrous.io/>

## Materials

* Courseware <http://imaker.iee.io/linux>
* 实验楼 <https://www.shiyanlou.com/>

# Lab Reports and Technical Writing

## Starting

* `cp -r /home/EE/go/work ~/`
* `cd`; `chmod 700 work`
* `cd work`
* Edit the `header.md` and `work??.md` files
* `make` to get `report.pdf`
* View the resulting `report.pdf`
    - `smbclient //go.iee.io/user -U user`; `cd work`; `get report.pdf`
    - `\\go.iee.io`; User: `ee\user`

## Editors

* [Vim](http://www.vim.org/)
* [MarkPad](http://code52.org/DownmarkerWPF/)
* [Atom](https://atom.io/)
* [Sublime Text 3 Beta](https://www.sublimetext.com/3)

## Lab Report

> * 实验目的 (Objective)
> * 引言 (Introduction)
> * 材料和方法 (Materials and Methods)
> * 实验过程 (Procedure)
> * 问题 (Problems)
> * 实验结果 (Results)
> * 探讨 (Discussion)
> * 结论 (Conclusion)
> * 参考文献 (References)
> * 附录 (Appendices)

## Communities

> * ChinaUnix <http://www.chinaunix.net/>
> * Ubuntu 论坛 <http://forum.ubuntu.org.cn/>
> * 水木社区 <http://newsmth.net>
> * Stackoverflow <https://stackoverflow.com/>
> * Github <https://github.com/>
> * Bitbucket <https://bitbucket.org/>
> * ...
> * Bing or Google Search

## Online Writing

Markdown for further report-alike formatting.

> * 简书 <http://www.jianshu.com/>
> * Raysnote <https://raysnote.com/>
> * Github <https://github.com/>
> * Bitbucket <https://bitbucket.org/>

## Reports Submitting

* To: `ee@i.iee.io`
* Subject: `14284060xx-姓名-report-001`
* Body: What's New, links
* Attachments: `14284060xx-姓名-report-001.pdf`
* Version number incriments.
* Optional: `14284060xx-姓名-note-001.pdf` other than links

# Scores and Credits\
(To Be Discussed)
