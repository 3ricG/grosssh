# $< == First prereq
# $@ == Target
# %  == Any non-empty substring (aka, wildcard char)
# patsubst  PATTERN,REPLACEMENT,TEXT  == find whitespace-separated words in TEXT that match PATTERN, and replace with REPLACEMENT
# wildcard  PATTERN						  == find files that match pattern, return space separated list

STYLE=style.css
#PANDOCARGS=--standalone -V title:"" --css=$(STYLE) --section-divs --email-obfuscation=references --include-in-header=./static_html/head.html --include-before-body=./static_html/header.html --include-after-body=./static_html/footer.html
PANDOCARGS=--standalone -V title:"" --css=$(STYLE) --email-obfuscation=references --include-in-header=./static_html/head.html --include-before-body=./static_html/header.html --include-after-body=./static_html/footer.html --from=markdown+header_attributes+gfm_auto_identifiers+simple_tables --to=html5

STATIC_CONTENT=./static_html/footer.html ./static_html/head.html ./static_html/header.html

%.ico: images/favicon.png
	convert png:$< ico:$@
	@chmod 644 $@

%.html: tea/%.md $(STATIC_CONTENT) | $(STYLE) 
	pandoc $(PANDOCARGS) --output=$@ $<
	head -n 10 $< | { grep -i date || true; }
	@chmod 644 $@

%.html: %.md $(STATIC_CONTENT) | $(STYLE) 
	pandoc $(PANDOCARGS) --output=$@ $<
	@chmod 644 $@

ROOTHTML:=$(patsubst %.md,%.html,$(wildcard *.md))
TEAHTML:=$(patsubst tea/%.md,%.html,$(wildcard tea/*.md))
all: $(TEAHTML) $(ROOTHTML) favicon.ico
	@echo Check permissions, then use make push to upload.

sitemap.xml: $(patsubst %.md,%.html,$(wildcard *.md))
	./gensitemap.sh > $@
	@chmod 644 $@

push:
	rsync -Favz . gross.sh:/tmp/grosssh/

# Dont do this without moving static stuff...
clean:
	rm -f *.html *.ico sitemap.xml

