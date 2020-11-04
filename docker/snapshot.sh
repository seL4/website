#!/bin/bash
#
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

set -e

export OUTPUT_SNAPSHOT_DIR="snapped_site"

docker/apache-up.sh

echo "::group::Snapshot website PR"
# wget is giving bad return codes, even when things seem OK. Turn off
# error checking for this section.
set +e
# Use wget to take a static snapshot of the Apache served website
# Note that we skip sites not hosted by this website, and we skip
# pipermail (since it's not related to the site content), and
# About/Perfomance, as it's dynamically generated on the live server
wget \
    --recursive \
    --page-requisites \
    --adjust-extension \
    --span-hosts \
    --convert-links \
    --domains localhost \
    --exclude-domains wiki.sel4.systems,docs.sel4.systems \
    --exclude-directories pipermail,About/Performance \
    --no-parent \
    --directory "$OUTPUT_SNAPSHOT_DIR" \
    localhost

set -e
echo "::endgroup::"

echo "::group::Show files"
ls -lan
ls -lan "$OUTPUT_SNAPSHOT_DIR"
echo "::endgroup::"

echo "::group::Fix output permissions"
chown -R 1001:116 "$OUTPUT_SNAPSHOT_DIR"
echo "::endgroup::"

echo "::group:: Remove canonical link refs to seL4.systems for link checking"
find "$OUTPUT_SNAPSHOT_DIR" -name "*.html" | \
  xargs sed -i'~' -e "s|<link href=\"https://sel4.systems/.*\" rel=canonical />||g"
echo "::endgroup::"

echo "::group::Stop apache"
apachectl stop
echo "::endgroup::"

