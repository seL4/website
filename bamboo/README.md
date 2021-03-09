# CI log pages

This directory contains resources and the main generation script for
the test logs under <https://sel4.systems/~bamboo/>.

- [`assets`](assets/) has static pages and css.
  These are deployed to the website on merges to the `master` branch of this
  repo via the corresponding GitHub action in this repo.

- `summary.py`(summary.py) is the script that turns a set of logs and
  test result summary in to an overview page for a test run. See the in-file
  docs for usage. The script is run from the CI pipeline (currently Bamboo)
  at the notification stage of tests. The CI pipeline will pull the
  `master` branch of this repo for each test.
