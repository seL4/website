# Copyright 2023 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: BSD-2-Clause
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
MAKEFLAGS += --warn-undefined-variables --no-builtin-rules
.DELETE_ON_ERROR:
.SUFFIXES:
.PHONY: help build serve debug clean doctor update

help:
	@echo -e "Usage: make <target>. Available seL4 website targets:\n\
		\n\
		build       Generate the static files and put them in _site/.\n\
		serve       Host site locally on port 4000 for previewing before commit.\n\
		debug       Host the development version of the site for local testing.\n\
		clean       Remove generated files.\n\
		doctor      Run jekyll doctor to check configuration.\n\
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

