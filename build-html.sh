#!/bin/sh

cat Components/ReferenceHeader.md Components/License.md CREDITS.md Reference/*/*.md | markdown -T -f +toc > reference.html
# build-html.lua MDifies the chapters, then alters the MD going in to have an extra level of # after it.
cat Components/ReferenceHeader.md Reference/*/*.md | lua build-html.lua > all.md
cat CREDITS.md Components/License.md >> all.md
cat all.md | markdown -T -f +toc > all.html
