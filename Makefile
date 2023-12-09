# Copyright 2020 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: BSD-2-Clause

default: serve

.PHONY: ruby_deps serve build doctor clean check_liquid_syntax check_html_output

ruby_deps: Gemfile Gemfile.lock
	bundle install

# Rules for local serving of the site using jekyll.
# Supports docker or running using local environment.
# The _production versions run with JEKYLL_ENV=production which will show additional content.
JEKYLL_ENV:=development

# --host 0.0.0.0 serves on all interfaces, so that docker can export
# the connection; also works locally
serve build: ruby_deps
	@JEKYLL_ENV=$(JEKYLL_ENV) bundle exec jekyll $@

clean doctor:
	@bundle exec jekyll $@

LIQUID_CUSTOM_TAGS := continue
LIQUID_LINTER_FILES := '*.html' '*.md'
LIQUID_LINTER_CMDLINE := liquid-linter $(LIQUID_CUSTOM_TAGS:%=--custom-tag %)

# Liquid syntax linting check.
# If it is complaining about unknown custom tags -> add them to the list above.
# Requires `liquid-linter` to be installed.
# git ls-files won't list any files that are untracked
check_liquid_syntax:
	git ls-files $(LIQUID_LINTER_FILES) | xargs $(LIQUID_LINTER_CMDLINE)

# Output html checking using tidy.
# Any warnings or errors will be printed to stdout
# Requires `tidy` to be installed.
check_html_output: build
	find _site/ -iname "*.html"| xargs -l tidy -q --drop-empty-elements n -e

