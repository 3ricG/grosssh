STYLE=style.css
PANDOCARGS=--standalone -V title:""\
 --css=$(STYLE)\
 --email-obfuscation=references\
 --include-before-body=./static_html/header.html\
 --include-after-body=./static_html/footer.html\
 --from=markdown+header_attributes+gfm_auto_identifiers+simple_tables+inline_notes\
 --to=html5
STATIC_CONTENT=./static_html/footer.html ./static_html/head.html ./static_html/header.html
MD_FILES=$(notdir $(wildcard *.md) $(wildcard **/*.md))
HTML_FILES=$(patsubst %.md,%.html,$(MD_FILES))
TEA_HTML_FILES=$(patsubst %.md,%.html,$(notdir $(wildcard tea/*.md)))

VPATH = posts tea

all: index.html tea.html $(HTML_FILES) favicon.ico sitemap.xml rss.xml
	@echo Check permissions, then use make push to upload.

index.md: genindex.sh $(filter-out index.html tea.html, $(HTML_FILES))
	./genindex.sh > $@
	@chmod 644 $@

tea.md: gentea.sh $(TEA_HTML_FILES)
	./gentea.sh > $@
	@chmod 644 $@

sitemap.xml: gensitemap.sh $(HTML_FILES)
	./gensitemap.sh > $@
	@chmod 644 $@

rss.xml: genrss.sh $(HTML_FILES)
	./genrss.sh > $@
	@chmod 644 $@

%.html: %.md $(STATIC_CONTENT) | $(STYLE) 
	pandoc $(PANDOCARGS) --output=$@ $<
	@chmod 644 $@

%.ico: images/favicon.png
	convert png:$< ico:$@
	@chmod 644 $@

push:
	rsync -Favz --exclude='.git*' . gross.sh:/tmp/grosssh/

# Dont do this without moving static stuff...
clean:
	rm -f *.html *.ico *.xml

