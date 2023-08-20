STYLE=style.css
PANDOCARGS=--standalone -V title:"" --css=$(STYLE) --email-obfuscation=references --include-in-header=./static_html/head.html --include-before-body=./static_html/header.html --include-after-body=./static_html/footer.html --from=markdown+header_attributes+gfm_auto_identifiers+simple_tables+inline_notes --to=html5
STATIC_CONTENT=./static_html/footer.html ./static_html/head.html ./static_html/header.html

VPATH = posts tea

all: $(patsubst %.md,%.html,$(notdir $(wildcard *.md) $(wildcard **/*.md))) favicon.ico
	@echo Check permissions, then use make push to upload.

# TODO: Make rules for "tea toc" and "posts toc" pages

%.html: %.md $(STATIC_CONTENT) | $(STYLE) 
	pandoc $(PANDOCARGS) --output=$@ $<
	@chmod 644 $@

%.ico: images/favicon.png
	convert png:$< ico:$@
	@chmod 644 $@

sitemap.xml: gensitemap.sh $(patsubst %.md,%.html,$(wildcard *.md))
	./gensitemap.sh > $@
	@chmod 644 $@

push:
	rsync -Favz --exclude='.git*' . gross.sh:/tmp/grosssh/

# Dont do this without moving static stuff...
clean:
	rm -f *.html *.ico sitemap.xml

