# Copyright 2023 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: BSD-2-Clause
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
MAKEFLAGS += --warn-undefined-variables --no-builtin-rules
.DELETE_ON_ERROR:
.SUFFIXES:
.PHONY: help build serve debug clean doctor checklinks update fix-home get-orig get-jekyll-blob get-orig-blob compare

help:
	@echo -e "Usage: make <target>. Available seL4 website targets:\n\
		\n\
		build       Generate the static files and put them in _site/.\n\
		serve       Host site locally on port 4000 for previewing before commit.\n\
		debug       Host the development version of the site for local testing.\n\
		clean       Remove generated files.\n\
		doctor      Run jekyll doctor to check configuration.\n\
		checklinks  Runs html-proofer to check for broken links.\n\
		update      Updates all Ruby Gem versions to the newest available.\n\
		help        This help text.\n"

.jekyll-cache/ruby_deps: Gemfile Gemfile.lock
	@bundle install
	@mkdir -p .jekyll-cache/
	@touch $@

JEKYLL_ENV := production

build serve: .jekyll-cache/ruby_deps
	JEKYLL_ENV=$(JEKYLL_ENV) bundle exec jekyll $@

debug: JEKYLL_ENV := development
debug: serve

clean doctor:
	@bundle exec jekyll $@

checklinks:
	@bundle exec htmlproofer --disable-external=false --enforce-https=false --only-4xx _site

update:
	@bundle update

# Collect all PLM files:
FROM := $(shell find content -type f -name '*.pml')

# Add Jekyll front matter to all PLM files:
PLM2JEKYLL1 := $(foreach f,$(FROM), sed -i '1s;^;---\n---\n;' $(f);)

# Convert PSP .pml links"
EXP2 := 's/<%@ include file="\(.*\).pml" *%>/{% include \1.html %}/'
PLM2JEKYLL2 := $(foreach f,$(FROM), sed -i $(EXP2) $(f);)

# Convert all other PSP links"
EXP3 := 's/<%@ include file="\(.*\)" *%>/{% include \1 %}/'
PLM2JEKYLL3 := $(foreach f,$(FROM), sed -i $(EXP3) $(f);)

# Rename all .plm files to .html:
MVALL := $(foreach f,$(FROM), git mv $(f) $(basename $(f)).html;)

convert:
	@$(PLM2JEKYLL1)
	@$(PLM2JEKYLL2)
	@$(PLM2JEKYLL3)
	@git commit -s -m "Automated plm to jekyll" content/
	@$(MVALL)
	@git commit -s -m "Automated rename from .plm to .html" content/

F2 := $(shell find . -path ./vendor -prune -o -name 'home.html' -print)
fix-home:
	$(foreach f,$(F2), git mv $(f) $(dir $(f))index.html;)

EXCLUDES := pdf mp4 png jpg jpeg svg ico gif zip bin license licence eot woff woff2 ttf eot? patch abstracts
comma := ,
empty:=
space := $(empty) $(empty)
WGET := wget -r -np --mirror -R $(subst $(space),$(comma),$(EXCLUDES))

# For comparison with _site: (Add -k option for local viewing instead)
get-orig:
	@$(WGET) http://sel4.systems/ -P .orig
	@echo "Downloaded sel4.systems to .orig"

# Concatenates all files into one blob so we can compare across file renames:
get-orig-blob:
	$(WGET) http://sel4.systems/ -O .orig-blob
	@echo "Downloaded sel4.systems to .orig-blob"

get-jekyll-blob:
	echo "Please run 'make serve' in another terminal"
	$(WGET) localhost:4000 -O .jekyll-blob
	echo "Downloaded localhost:4000 to .jekyll-blob"

FIND := find . -type f $(addprefix ! -name *.,$(EXCLUDES))
CMD := echo

compare: #build
	@(cd .orig/sel4.systems && $(FIND) ! -name '*.pml*' | sort | xargs -I x $(CMD) "x") > .all_orig.txt
	@(cd _site/ && $(FIND) | sort | xargs -I x $(CMD) "x") > .all_jekyll.txt
	@diff -u .all_orig.txt .all_jekyll.txt | less

##############################################################################################################
# TODO:
# - Navigation menu
# - Breadcrumbs
# - Permanent redirects:
#   	all .pml -> .html with .htaccess and mod_alias:
#   	RedirectMatch permanent ^(.*)/home.pml$ $1/index.html
#   	RedirectMatch permanent ^(.*).pml$ $1.html
#	Redirect permanent /Info/Docs/index.html https://docs.sel4.systems/Documentation
#	or
#	<meta http-equiv="refresh" content="0; url="...">
#	<link rel="canonical" href="..." />
#  See also https://developers.google.com/search/docs/crawling-indexing/301-redirects#metarefresh
#  https://stackoverflow.com/questions/51178289/permanently-redirect-jekyll-pages-to-external-site-without-markdown
#
#	Or add redirect_from: to all html files.
#
# - News
#	Convert to posts?
#
# - Cleanup
#	Delete obsolete files
#	Tidy up Makefile
# - Fix Copyrights
# - Fix titles
# - SEO