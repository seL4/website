# Copyright 2023 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: BSD-2-Clause
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
MAKEFLAGS += --warn-undefined-variables --no-builtin-rules
.DELETE_ON_ERROR:
.SUFFIXES:
.PHONY: help build serve debug clean doctor checklinks update get-orig get-jekyll-blob get-orig-blob compare

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

HTMLPROOFEROPT := --swap-urls '^https\://sel4.systems:http\://localhost\:4000'
HTMLPROOFEROPT += --enforce-https=false --only-4xx --disable-external=false

checklinks:
	@bundle exec htmlproofer $(HTMLPROOFEROPT) _site

update:
	@bundle update

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

compare: build
	@(cd .orig/sel4.systems && $(FIND) ! -name '*.pml*' | sort | xargs -I x $(CMD) "x") > .all_orig.txt
	@(cd _site/ && $(FIND) | sort | xargs -I x $(CMD) "x") > .all_jekyll.txt
	@diff -u .all_orig.txt .all_jekyll.txt | less

##############################################################################################################
# TODO:
# - Cleanup
#	Delete obsolete files
#	Tidy up Makefile
# - Fix Copyrights
# - Fix titles
# - SEO
