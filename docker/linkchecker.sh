#!/bin/bash
#
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

OUTPUT_SNAPSHOT_DIR="snapped_site"
OUTPUT_DIR="$OUTPUT_SNAPSHOT_DIR/localhost/pr_checks"

echo "::group::Run linkchecker"
# Because of permissions issues, linkchecker can't write to a file,
# so we instead output HTML, and redirect it to a file.
# We also don't want the return code of the linkchecker to stop the
# whole process, so we use bad codes to touch a file, which will handle
# errors later on

mkdir -p "$OUTPUT_DIR"
chmod go+rwx "$OUTPUT_DIR"

linkchecker \
    --no-status \
    --ignore-url="print$" \
    --ignore-url="/blob/" \
    --ignore-url="/About/Performance" \
    --ignore-url="/lists/" \
    --ignore-url="https://ethz.ch/en.html" \
    --ignore-url="https://en.horizon.auto" \
    --ignore-url="https://nio.com" \
    --ignore-url="https://lixiang.com" \
    --ignore-url="https://www.rtx.com" \
    --ignore-url="https://defcon.org/html/defcon-29/dc-29-index.html" \
    --check-extern \
    --output html \
    "$OUTPUT_SNAPSHOT_DIR"/localhost/index.html > $OUTPUT_DIR/linkchecker.html \
    || touch .linkchecker_failed

echo "::endgroup::"
