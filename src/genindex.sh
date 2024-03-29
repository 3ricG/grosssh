#!/usr/bin/env bash

declare root="https://www.gross.sh"

cat << __HEADER__
---
title: GROSS.SH
---

\
\
\
\


---

#### Recent Posts: {.green}
<dl>
__HEADER__

for f in `find . -type f -iname '*.md' ! -name 'index.md' ! -name 'now.md'`; do
  first=$(git log --follow --format=%ad --date=format:"%B %d, %Y" $f | head -n 1)
  last=$(git log --follow --format=%ad --date=format:"%B %d, %Y" $f | tail -n 1)
  title=$(head -n 5 $f | grep -i title | sed 's/^\s*title:\s*//g')
  echo "<dt>${first}</dt>"
  line="<dd>[${title}]($(basename -s .md $f).html) %UPDATED%</dd>"
  if [[ "$first" == "$last" ]]; then
    line=$(echo $line | sed "s/%UPDATED%/[Updated: ${last}]/g")
  else
    line=$(echo $line | sed 's/%UPDATED%//g')
  fi
  echo $line
done

cat << __FOOTER__
</dl>


TODO:
  - Replace find with git command
  - Sort files from git original commit date
__FOOTER__
