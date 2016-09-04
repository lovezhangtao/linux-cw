#!/bin/sh

if [ -d $1 ] ; then
    if [ ! -e deploy/$1 ] ; then
        mkdir deploy/$1
    fi
    pandoc --template template.html -s -i -t revealjs -p \
        --mathjax="/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML" \
        --slide-level=2 --highlight-style=espresso \
        -V revealjs-url=/reveal.js -V theme=black -V history \
        $1/index.md -o deploy/$1/index.html
    if [ -d $1/res ] ; then
        rsync -a --delete $1/res deploy/$1
    fi
    rsync -av --delete deploy/$1 x@10.10.12.73:/usr/local/www/linuxcw
fi
