# Copyright 2023 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: BSD-2-Clause
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
MAKEFLAGS += --warn-undefined-variables --no-builtin-rules
.DELETE_ON_ERROR:
.SUFFIXES:
.PHONY: help build serve debug preview clean doctor checklinks update \
	on_seL4

help:
	@echo -e "Usage: make <target>. Available seL4 website targets:\n\
		\n\
		build       Generate the static files and put them in _site/.\n\
		on_sel4     As above, but into _site_on_seL4/ for the seL4-hosted version.\n\
		serve       Host site locally on port 4000 for previewing before commit.\n\
		debug       Host the development version of the site for local testing.\n\
		preview     Generate GitHub prievew of the site in pull requests.\n\
		clean       Remove generated files.\n\
		doctor      Run jekyll doctor to check configuration.\n\
		checklinks  Runs html-proofer to check for broken links.\n\
		validate    Runs html5validator to check for HTML5 compliance.\n\
		update      Updates all Ruby Gem versions to the newest available.\n\
		help        This help text.\n"

.jekyll-cache/ruby_deps: Gemfile Gemfile.lock
	bundle install
	@mkdir -p .jekyll-cache/
	@touch $@

.npm_deps: package.json package-lock.json
	npm install
	@touch $@

JEKYLL_ENV := production
SERVE_HOST :=
BUILD_OPTS :=

build: .jekyll-cache/ruby_deps .npm_deps
	JEKYLL_ENV=$(JEKYLL_ENV) bundle exec jekyll build $(BUILD_OPTS)

serve: BUILD_OPTS := --config "_config.yml,_dev_pages.yml" $(BUILD_OPTS)
serve: .jekyll-cache/ruby_deps .npm_deps
# $(SERVE_HOST) is here so docker can pass in "--host 0.0.0.0" for serve
# otherwise this variable is not needed and by default empty
	JEKYLL_ENV=$(JEKYLL_ENV) bundle exec jekyll serve -I --livereload $(BUILD_OPTS) $(SERVE_HOST)

debug: BUILD_OPTS := --config "_config.yml,_dev_pages.yml" $(BUILD_OPTS)
debug: JEKYLL_ENV := development
debug: serve

preview: JEKYLL_ENV := development
preview: BUILD_OPTS := --config "_config.yml,_preview.yml" $(BUILD_OPTS)
preview: build

on_seL4: BUILD_OPTS := --config "_config.yml,_on_seL4.yml" $(BUILD_OPTS)
on_seL4: build

clean doctor:
	@bundle exec jekyll $@
	@rm -rf _preview/*

# list of URL regexps to ignore when checking links
# font preload/preconnect URLS give 404 on link check, but work;
# twitter ignored because of rate limiting;
# query links on github work, but don't seem to check;
# rtx.com produces 403 from GitHub;
IGNORE_URLS  = fonts.gstatic.com
IGNORE_URLS += fonts.googleapis.com
IGNORE_URLS += twitter.com
IGNORE_URLS += flaticon.com
IGNORE_URLS += github.com.seL4.rfcs.pulls\?q
IGNORE_URLS += rtx.com
IGNORE_URLS += www.collinsaerospace.com
IGNORE_URLS += www.linkedin.com/in/
IGNORE_URLS += dl.acm.org/doi/10.1145/224056.224075
IGNORE_URLS += softwareengineering.stackexchange.com/questions/99543
IGNORE_URLS += www.hrad.cz/en/prague-castle-for-visitors
IGNORE_URLS += ieee.org
IGNORE_URLS += sel4summit2025.sched.com
IGNORE_URLS += acm.org
IGNORE_URLS += awards.acm.org
IGNORE_URLS += www.leopoldina.org/en/members/member-list/detail/gernot-heiser

sep:= /,/
empty:=
space:= $(empty) $(empty)
IGNORE_EXP:= $(subst $(space),$(sep),$(IGNORE_URLS))

HTMLPROOFEROPT := --swap-urls '^https\://sel4.systems:http\://localhost\:4000'
HTMLPROOFEROPT += --enforce-https=false --only-4xx --disable-external=false
HTMLPROOFEROPT += --ignore-urls '/$(IGNORE_EXP)/'

checklinks:
	@bundle exec htmlproofer $(HTMLPROOFEROPT) _site

validate:
# ignore errors from inline SVG files
	@html5validator --root _site \
					--ignore 'is not a "color" value' \
							 'not allowed on element "svg"' \
							 'The "font" element is obsolete' \
							 'xmlns:svg' \
							 'sodipodi:namedview'

update:
	bundle update
	npm update
