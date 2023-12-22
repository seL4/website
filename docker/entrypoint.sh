#!/bin/bash
#
# Copyright 2023, Proofcraft Pty Ltd
#
# SPDX-License-Identifier: BSD-2-Clause
#

set -ex

cd /mnt
bundle install

if [ $# -eq 0 ]; then
    make build
else
    make "$@"
fi
