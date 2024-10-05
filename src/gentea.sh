#!/usr/bin/env bash

declare root="https://www.gross.sh/tea.html"

cat << __HEADER__
---
title: GROSS.SH - TEA
---

<div class="asciiart">
<figure role="img" aria-hidden="true">
<pre class="green">
 ▄▄▄▄▄▄████▄▄▄▄▄▄▄▟███▄▄▄▄▄▄▄▄
 ▓███████████████████████████▓
 ▓▓▀▀▀▀▜███▀▀▀▀▀▀▀▜███▀▀▀▀▓▓▓▓
 ▒▒    ▐███ ▗▄▄▄▄ ▐███    ▝▒▒
 ▒░    ▝▓▀▜▟██████▟▀▀▓     ░
 ░     ▝▗▟████▛▜████▄░     ░
 ▝    ▄▟████▛▘  ▝▜████▙▄
  ▗▄▟█████▀▘ ▄▄▄▖░▝▜██████▄▄▖
▝██████▛▀    ███▌ ░  ▀▜██████░
 ▓█▛▀███████████████████▓▀▜█▓░
 ░▓  ███████████████████▓   ░
 ░░          ███▌       ▒   ▝
  ░  ▗▟███▌  ███▌  ████▄▒▒
    ▄████▓   ███▌   ▓████▒
 ▗▄████▛▒▒   ███▌   ░░▜████▄
 ░░▜██▀  ░   ███▌   ░  ▝██▓▘
  ░░░ ▝      ▀▓▓▒   ▝   ▓▓
  ░░░         ▒▒░       ░
   ░
</pre>
</figure>
</div>

<dl>
__HEADER__

# Giant ugly git command to get sorted list of files I care about
files=$(\
   git ls-files -z -- 'tea/*.md' | \
   xargs -0 -I{} -- sh -c 'git log -1 --format="%at {}" {} | tail -1' | \
   awk '{print $NF}'\
)

for f in $files; do
  # Get first and last commit dates, based on git logs
  last=$(git log --follow --format=%ad --date=format:"%s" $f | head -n 1)
  first=$(git log --follow --format=%ad --date=format:"%s" $f | tail -n 1)
  publ=$first
  
  # Check for defined first date, and override git if its older
  orig=$(date --date="$(grep -m 1 -oP "date:\s*\K(.*)" $f)" +"%s")
  origdiff=($first-$orig)/86400
  [[  "$origdiff" -gt "0" ]] && publ=$orig

  # Determine if file was ever modified after first commit
  diff=($last-$first)/86400
  title=$(head -n 5 $f | grep -i title | sed 's/^\s*title:\s*//g')
  publ=$(date +'%b %d, %Y' -d @$publ)
  last=$(date +'%b %d, %Y' -d @$last)
  
  # Add update note if it was modified after first commit
  line="<dt>${publ}%UPDATED%</dt>"
  if [[ "$diff" -gt "0" ]]; then
    line=$(echo $line | sed "s|%UPDATED%|, <span style='font-style:italic;' class='green'>Updated: ${last}</span>|g")
  else
    line=$(echo $line | sed 's/%UPDATED%//g')
  fi
  echo $line
  echo "<dd>[${title}]($(basename -s .md $f).html) </dd>"
done

cat << __FOOTER__
</dl>

__FOOTER__
