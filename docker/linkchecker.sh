#!/bin/bash

OUTPUT_SNAPSHOT_DIR="snapped_site"

echo "::group::Run linkchecker"
# Because of permissions issues, linkchecker can't write to a file,
# so we instead output HTML, and redirect it to a file.
# We also don't want the return code of the linkchecker to stop the 
# whole process, so we use bad codes to touch a file, which will handle
# errors later on

linkchecker \
    --no-status \
    --ignore-url="print$" \
    --ignore-url="/blob/" \
    --ignore-url="/About/Performance" \
    --ignore-url="/lists/" \
    --check-extern \
    --output html \
    "$OUTPUT_SNAPSHOT_DIR"/localhost/index.html > $OUTPUT_SNAPSHOT_DIR/localhost/linkchecker.html \
    || touch .linkchecker_failed
    
echo "::endgroup::"
