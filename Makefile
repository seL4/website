# Copyright 2023 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: BSD-2-Clause
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
MAKEFLAGS += --warn-undefined-variables --no-builtin-rules
.DELETE_ON_ERROR:
.SUFFIXES:
.PHONY: help build serve debug clean doctor checklinks update

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
# $(SERVE_HOST) is here so docker can pass in "--host 0.0.0.0" for serve
# otherwise this variable is not needed and by default empty
	JEKYLL_ENV=$(JEKYLL_ENV) bundle exec jekyll $@ $(SERVE_HOST)

debug: JEKYLL_ENV := development
debug: serve

clean doctor:
	@bundle exec jekyll $@

HTMLPROOFEROPT := --swap-urls '^https\://sel4.systems:http\://localhost\:4000'
HTMLPROOFEROPT += --enforce-https=false --only-4xx --disable-external=false
# comma-separated list of URL regexps, e.g. /twitter.com,facebook.com/
# twitter ignored because of rate limiting
HTMLPROOFEROPT += --ignore-urls '/twitter.com/'

checklinks:
	@bundle exec htmlproofer $(HTMLPROOFEROPT) _site

update:
	@bundle update
