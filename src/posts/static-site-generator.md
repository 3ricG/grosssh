---
title: Static Website Generation
date: 2023-08-20
---

## Static Website Generation {.green}
##### August 20, 2023

For a number of months/years I've looked on and off for a system to generate static websites. There are a lot of 
potential scripts and frameworks, and I've tried a number of them - Jekyll^[<https://jekyllrb.com/> - Jekyll is a 
static site generator written in ruby. Its very popular for folks using GitHub, and may be the most popular static site
generation frameworks.], Hugo^[<https://gohugo.io/> - Hugo is a static site generator written in go with a focus on 
speed and flexibility. There are a lot of functionality that can be added to a site built with hugo, and hundreds of 
pre-built themes that you can tweak to your liking.], GatsbyJS^[<https://www.gatsbyjs.com/> - Gatsby is a site
generator built with JavaScript; more specifically, the React framework. This adds a ton of functionality and features
out of the box, and allows you to generate sites that work with data from many different sources (even a CMS like 
WordPress or Drupal).], and Pelican^[<https://getpelican.com/> - Pelican is a simple static site generator written in
Python. It uses Jinja2 templates for site generation, and has a fairly extensive repo of pre-built themes and plugins
to extend a basic site] to name a few. After all of this searching, I found what I was looking for. It required some
effort, but works really well for me.

### The Experiments {.yellow}

After my previous experience using heavy self hosted CMSs like WordPress and Drupal,
or even third party hosted CMSs like Blogger and WordPress.com, I have realized I don't really need all the functions
and features that come with these types of systems. For a few years I ran a WordPress site called tea.observer where I 
wrote (very few) tea reviews. I did not write enough for that to be worth the time and effort it took to maintain it, 
so I eventually merged that into [my personal site](tea.html). While running these systems, I was constantly worried
about potential security vulnerabilities, and site outages due to (failed) upgrades to address these issues. With these
concerns, the obvious jump is to move to a third-party hosted website. That would remove some security concerns (adding
new concerns that the third-party could be compromised) and would basically solve the maintenance issue. I've used a 
number of hosted solutions but these always felt a bit too out of my control, so I've never heavily invested in any of 
them. My next thought was to jump to a static website generation framework.

I have used Python and Jinja2 at work and home for various small templating tasks, so my first thought was to
look for a tool based on these technologies. That's how I 
stumbled onto Pelican - it was fairly simple, and built with tooling that I was familiar with. After spending a few 
hours playing with themes and plugins, I got something close to what I wanted; but felt like I was constantly fighting 
with the theme when I made small changes. It seemed like over time, with enough theme fighting, this would be ideal for
my posting style. I also _REALLY_ liked making posts in Markdown. This seemed super convenient and had enough 
flexibility that it could meet my general posting needs. Maybe I could just accept one of the pre-built themes instead 
of trying to make something more unique? I eventually stopped trying to make Pelican work, and decided to see what 
"popular" tools people were using to generate plain html sites. I now had one additional feature that I was looking for:
Markdown or Markdown-like posting syntax.

After reading various blog posts with titles like _TOP 5 STATIC SITE GENERATORS IN 2021_ or _MOST POPULAR STATIC SITE 
GENERATORS (FREE AND PAID)_, I decided to look into Hugo, GatsbyJS, and Jekyll.
These all had a list of features that seemed 
interesting, various ways to extend them in the future if I wanted, and fairly large userbases. The lists of additional
plugins and features always seemed tempting to me, even after thinking back to all of the features I didn't use in 
WordPress and large CMS tools. I played with Hugo for a few weeks/months and eventually got something that I liked from
a theme and config.
There was something about the workflow for using Hugo that I didn't like. The "scaffolding" that had to be created
around new posts felt cumbersome to me, and felt out of place when I was trying to make the site. 
This was actually common with all of these tools and frameworks, but I
think I first really noticed it with Hugo. It wasn't
even particularly worse than the others; but at this point in my search, I had realized that I wasn't liking all of the
extra content that I had to create to make the site work, and it made me feel like I didn't fully understand
the system I was using. Looking at the various sites generated with Hugo and GatsbyJS, it seemed like many people were 
trying to get a site that was a bit less than something you'd get out of a full fledged CMS; but not as basic as a truly
static page. Additionally with GatsbyJS, it seemed to be getting a bit closer to the larger scale paid solution that was
kind of the opposite I was going for. I'd likely never upgrade to a paid solution; but seeing it mentioned on the site 
an in various posts, I would likely always have the thought in the back of my mind that I'm missing out on some feature
(stupid, I know).

![Site Generator Logos](images/ssg/all_gen.png){.center width=75%}\

During this time I also started looking at Jekyll. This seemed really tempting because of the heavy use and integration
into GitHub Pages^[<https://pages.github.com/> - GitHub repository hosted project websites.]. I had used GitHub Pages 
for my super simple [OpenSearch Plugins page](https://3ricg.github.io/OpenSearchPlugins/) since hosting it myself
felt like overkill. If I went with Jekyll, I wouldn't have to use GitHub to host my personal website just because of the
integration; and the types of sites that people were generating seemed to be generally static project pages and simple 
blogs. It also had the one feature that I kept coming back to: generating posts via Markdown files. 
The themes seemed a bit extensive for my liking, but usable. I would have to fight with the themes just like I had to 
for all of the other frameworks, but if it ultimately was something I wouldn't touch a lot in the future, it would be 
worth the initial pain. There were a lot of themes, plugins, and features that were not free (sold/licensed by 
third-parties). In my theme investigation and research into Jekyll, I started to find that documentation and community 
posts were _heavily_ focused on GitHub Pages and using Jekyll with GitHub. This wasn't really a problem, but it kind of
soured me on Jekyll, and I started to get the feeling that I was looking at something that was still too "heavy" for my
use case.

At this point I had basically given up, and built a website very close to what you're looking at now. Originally gross.ooo,
gross.sh was a pile of static HTML that I manually linked and changed when I wanted something different. It was painful,
but trivial. I kept looking at what people were doing, and found others^[<https://log.schemescape.com/posts/static-site-generators/index.html>]
in a similar situation to mine, and saw many people building their own systems based on templates, Jinja2, perl scripts,
etc. They all seemed very convoluted and none of the ones I found really worked for me - they were tailor-made for that
specific user. I did find a really cool javascript solution to my problem in Markdeep^[<https://casual-effects.com/markdeep/> - 
a simple javascript file that you can source to turn your plain Markdown files into websites], but never actually tried
to use it. It _may_ have actually gotten me what I wanted; but it felt almost too absurd to use for my entire site. I 
can definitely appreciate the technology, as I could appreciate all of the frameworks I tried -  a lot of work went into
each one, they just didn't fit my use case or workflow.

### The Discovery {.yellow}

A few weeks ago, someone sent me Tavis Ormandy's [blog post on Zenbleed](https://lock.cmpxchg8b.com/zenbleed.html). I
recommend reading the post if you haven't already - its a great in-depth look at a newly discovered security issue for 
AMD's Xen 2 processors, [CVE-2023-20593](https://www.cve.org/CVERecord?id=CVE-2023-20593). While reading this post, I 
couldn't help but notice the simplicity of the website, and wondered what he was using to build his site. Given the 
nature of his work, I expected his solution to be relatively simple and secure. Looking around, he [actually describes
how he makes his website](https://lock.cmpxchg8b.com/about.html) - markdown, `pandoc`, and a Makefile. What could be 
more simple than that? And all of the pages are written in markdown, this sounded like it met all of my requirements. 
Tavis graciously provides all of his markdown and Makefiles on his website, so I was able to look through and 
understand how he implemented it.

This is a simple solution - I had used these tools before, but never really thought of tying them together like this.
Now, reading through `pandoc` docs, I see that there are... [a lot of solutions for this type of static site generation](
https://github.com/jgm/pandoc/wiki/Pandoc-Extras#static-website-generators). This makes sense, since html generation is
one of the features of `pandoc`. I had used `pandoc` for years, but never really thought of it as a tool like this because 
all of my experience was with one-off document conversions. `Pandoc` solves the Markdown to HTML problem, and the Makefile
basically automates any of the changes and updates.

I think the best part of this solution is that it is built on tools I'm familiar with and will use elsewhere. While it 
is good to learn new things, I personally don't see a major benefit in learning some of the other frameworks I've tested.
I could have benefited from learning some Ruby, Go, JavaScript, and other web technologies; but the tools in Tavis's 
solution are ones I'll use frequently and remain familiar with, even if I don't post for long periods of time.

### The Implementation {.yellow}

Instead of taking an existing solution, this one felt easy enough to do myself, with Tavis's files as a starting point.
Since he didn't post any kind of license information for the code used to generate his site, I contacted him for 
permission to reuse some of his code and build on top of it. He told me it was fine to reuse, so I got to work.

The first thing I did was generate my page using his style, then started manually merging in my existing style. His 
style and the default viewport settings generated by `pandoc` helped me a lot. My old website was not mobile friendly at 
all, and was brutal to move around without zooming on a phone. That got me into reading about better practices for mobile
websites, including [relative length units](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units#relative_length_units)
to better handle different screen sizes, and [media selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/@media)
to change behavior completely for different sizes. Take a look at my [tea](tea.html) page for an example of this:

<div class='code'>
``` {.css} 
@media (min-width:700px) {
   dt {
      width:                  27em;
      float:                  left;
      clear:                  left;
   }
   dd {
      margin:                 0 0 0 4em;
      padding:                0 0 0.5em 0;
   }
}
@media (max-width:700px) {
   dl {
      text-align:             center;
   }
   dt {
      padding-top:            0.75em;
   }
   dd {
      padding:                0;
      margin:                 0;
   }
}
```
</div>

I'm sure that I'm doing some things poorly, but it has been much easier to manage than my previous attempts. Feel free
to take a look at my style and make suggestions if you have any!

After getting the style to be about what I wanted, I pulled my header out of all of my static html files and created a
footer for the page. These could be static html since they're easy enough to manage that way, and don't actually contain
any data that makes sense to store as Markdown. This was pretty simple, and would give me the flexibility to add or edit
them without having to modify every single page in my website (manually). The next page I started working on was the 
[tea](tea.html) page. I had to modify this a lot while working on the style, so using it as the first conversion to 
Markdown made sense. Long term, this page and other "listing" pages may be automatically generated based on file metadata
or though some other method. Since this is a small amount of data, it was easy to start with, and allowed me to also 
begin modifying the Makefile. Tavis's Makefile was a really good starting point, especially because it gave me a starting
`pandoc` command. My modified version at the time of this writing is shown below, with some modifications to make it look
a bit nicer on this page:

<div class='code'>
``` {.makefile}
STYLE=style.css
MD=markdown+header_attributes+gfm_auto_identifiers+simple_tables+inline_notes
PANDOCARGS=--standalone -V title:"" \
 --css=$(STYLE) \
 --email-obfuscation=references \
 --include-in-header=./static_html/head.html \
 --include-before-body=./static_html/header.html \
 --include-after-body=./static_html/footer.html \
 --from=$(MD) \
 --to=html5
STATIC_CONTENT=./static_html/footer.html ./static_html/head.html \
 ./static_html/header.html

VPATH = posts tea

all: $(patsubst %.md,%.html,$(notdir $(wildcard *.md) $(wildcard **/*.md)))\
 favicon.ico
   @echo Check permissions, then use make push to upload.

# TODO: Make rules for "tea toc" and "posts toc" pages
# TODO: Make rule for RSS feed

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
```
</div>

I made quite a few modifications to the original, most of them based on how I plan to make my site and generate future posts. If
you're familiar with `make`, you can probably skip this paragraph, since what I'm doing may be obvious. The file you see
now is what I created after a few revisions, but its good enough to start. The first thing to note is the additional 
`pandoc` arguments. You'll see the header and footer includes, and all of the extensions I use based on the flavor of 
markdown I write. I may trim this down or add more in the future, depending on how I change my style and if I really 
want some of the more unique features of `pandoc` markdown. The [special VPATH variable](https://www.gnu.org/software/make/manual/html_node/General-Search.html)
allows `make` to search additional directories for prerequisites and targets. This lets me make a much simpler set of
rules, including the rule for the `all` target. The prerequisites are an amalgamation of functions that ultimately 
return a list of every html file that I want to generate (find the name of all markdown files, stripping any directory
in their path, and replacing "md" with "html"). The rule for the `%.html` target is relatively generic, telling `make` 
to regenerate any html files if their corresponding markdown or any of the static html is updated. You'll also notice 
the style is an order-only-prerequisite. This is originally from Tavis's Makefile, but I kept it so that my rule would
fail if I somehow accidentally deleted the CSS file. This also means that if I update the CSS file, it won't trigger all
of my html files to be updated, since updating the CSS is independent of the individual pages. The next two rules I 
left in since they seemed relatively useful.

The gensitemap is also from Tavis's site, with two modifications - a new root, and an updated `find` command to exclude
my static html:

<div class="code">
```bash
#!/bin/bash

# Taken from Tavis Ormandy's website - https://lock.cmpxchg8b.com/about.html

declare root="https://www.gross.sh"

cat << __HEADER__
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
__HEADER__

find . -type f -iname '*.html' -not -path "*static_html*" -printf "<url>
    <loc>${root}/%P</loc>
    <lastmod>%TY-%Tm-%Td</lastmod>
</url>\n"

cat << __FOOTER__
</urlset>
__FOOTER__
```
</div>

With the Makefile created, I then had to convert every existing HTML page to Markdown. While I could have used `pandoc`
to do the conversion, doing it manually helped me smooth out some of the weirder aspects of the styling. It also helped
me get used to the workflow and fix smaller bugs in my Makefile that aren't shown above!

### The End {.yellow}

In the end, I think I've found what I've been looking for, using tools I already had and some modifications to a site I
was manually maintaining. I plan to keep the page relatively simple, but I could see myself growing this into an
abomination. You may have already noticed I'm including lots of different things in here to test out the Markdown 
features - code blocks with syntax highlighting based on language, inline code, images, and footnotes (If
I'm being honest with myself the footnotes are completely unecessary on this page). I could also mold this tool into 
something overly complicated with crazy scripts and pages; making the page just as hard to maintain as it would have 
been in any of the other frameworks and tools I've tried. If it does come to that, at least it will be familiar to me! 

I already have plans for at least one scripted piece - the [tea](tea.html) page, and a future [posts](#) page. These are
basically listings of other pages on the site, so there's no real reason to maintain them manually. Similar to the 
sitemap, I could automatically generate these, but I do need some additional parsing for the metadata block at the top 
so that I can get the "publication date" rather than the last modification time of the file. I had an idea to modify 
`pandoc` to write the metadata block properties to the extended attributes of the output file; but it seems that it 
might be difficult/impossible to do using the [custom Lua pandoc writer](https://pandoc.org/custom-writers.html) 
framework due to the input/output requirements. I did think about trying to modify pandoc to do it with a flag, but I'm
still learning [Haskell](https://www.haskell.org/) and trying to wrap my head around the [pandoc source](https://github.com/jgm/pandoc/).

Another plan I have is to _eventually_ generate an RSS feed for the new posts on the page. This would be a combination 
of any posts that contain the metadata block with a publication date, and exclude any one-off pages and static content.
This isn't super important to make, and more of an experiment than something anyone will end up using.

If you made it to the end, thanks for reading, and I hope this post was interesting and useful to you!

## Update - 2023-08-28 {.green}

I made my GitHub repo, so if you'd like to see all the markdown and the Makefile that is used to make my site, you can 
find it here: https://github.com/3ricG/grosssh
