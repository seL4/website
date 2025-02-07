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
		serve       Host site locally on port 4000 for previewing before commit.\n\
		debug       Host the development version of the site for local testing.\n\
		clean       Remove generated files.\n\
		doctor      Run jekyll doctor to check configuration.\n\
		checklinks  Runs html-proofer to check for broken links.\n\
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

build: .jekyll-cache/ruby_deps .npm_deps
	JEKYLL_ENV=$(JEKYLL_ENV) bundle exec jekyll build $(BUILD_OPTS)

serve: .jekyll-cache/ruby_deps .npm_deps
# $(SERVE_HOST) is here so docker can pass in "--host 0.0.0.0" for serve
# otherwise this variable is not needed and by default empty
	JEKYLL_ENV=$(JEKYLL_ENV) bundle exec jekyll serve -I --livereload $(BUILD_OPTS) $(SERVE_HOST)

debug: JEKYLL_ENV := development
debug: serve

preview: JEKYLL_ENV := development
preview: BUILD_OPTS := --config "_config.yml,_proofcraft.yml" $(BUILD_OPTS)
preview: build

on_seL4: BUILD_OPTS := --config "_config.yml,_on_seL4.yml" $(BUILD_OPTS)
on_seL4: build

clean doctor:
	@bundle exec jekyll $@
	@rm -rf _preview/*

HTMLPROOFEROPT := --swap-urls '^https\://sel4.systems:http\://localhost\:4000'
HTMLPROOFEROPT += --enforce-https=false --only-4xx --disable-external=false
# comma-separated list of URL regexps, e.g. /twitter.com/,/facebook.com/
# twitter ignored because of rate limiting; query links on github work, but don't seem to check
# rtx.com produces 403 from GitHub
HTMLPROOFEROPT += --ignore-urls '/twitter.com/,/flaticon.com/,/github.com.seL4.rfcs.pulls\?q/,/rtx.com/,/www.collinsaerospace.com/'

checklinks:
	@bundle exec htmlproofer $(HTMLPROOFEROPT) _site

update:
	bundle update
	npm update
