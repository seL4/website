#!/bin/bash
#
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

set -ex

cd /mnt
bash docker/apache-up.sh
echo "Type \"exit\" to shut down container."
echo "Site available at http://localhost:8080/"
bash
