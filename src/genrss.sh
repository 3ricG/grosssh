#!/bin/bash

declare root="https://www.gross.sh"

cat << __HEADER__
<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">

<channel>
  <title>GROSS.SH</title>
  <link>https://www.gross.sh</link>
  <description>GROSS.SH</description>
__HEADER__

for f in `find . -type f -iname '*.html' -not -path "*static_html*" -printf "%P\n"`; do
   md=$(find -name "*${f%.html}.md")
   lastsec=$(git log --follow --format=%ad --date=format:"%s" $md | head -n 1)
   title=$(grep -i 'meta property="og:title' $f | sed -E 's|.*content="([^"]+)".*|\1|g')
   if [[ -z "${title// }" ]]; then
      title="${f%.html}"
   fi
   desc=$(grep -i 'meta property="og:description' $f | sed -E 's|.*content="([^"]+)".*|\1|g')
   if [[ -z "${desc// }" ]]; then
      desc="${f%.html}"
   fi
   if [ ! -z "$lastsec" ]; then
      last=$(date +'%a, %d %b %Y' -d @$lastsec)
      echo "   <item>"
      echo "       <title>$title</title>"
      echo "       <description>$desc</description>"
      echo "       <link>${root}/$f</link>"
      echo "       <pubDate>${last}</pubDate>"
      echo "   </item>"
   fi
done
cat << __FOOTER__
</channel>

</rss> 
__FOOTER__
