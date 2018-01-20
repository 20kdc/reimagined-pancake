#!/bin/sh
cat ../ReferenceHeader.md ../CREDITS.md *.md | markdown -T -f +toc > book.html
