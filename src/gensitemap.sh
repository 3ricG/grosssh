#!/bin/bash

# Taken and modified from Tavis Ormandy's makefile - https://lock.cmpxchg8b.com/about.html

declare root="https://www.gross.sh"

cat << __HEADER__
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
__HEADER__

for f in `find . -type f -iname '*.html' -not -path "*static_html*" -printf "%P\n"`; do
   md=$(find -name "*${f%.html}.md")
   lastsec=$(git log --follow --format=%ad --date=format:"%s" $md | head -n 1)
   if [ ! -z "$lastsec" ]; then
      last=$(date +'%Y-%m-%d' -d @$lastsec)
      echo "<url>"
      echo "    <loc>${root}/$f</loc>"
      echo "    <lastmod>${last}</lastmod>"
      echo "</url>\n"
   fi
done
cat << __FOOTER__
</urlset>
__FOOTER__
