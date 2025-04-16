#!/bin/bash
#
# Copyright 2023, Proofcraft Pty Ltd
#
# SPDX-License-Identifier: BSD-2-Clause
#

# load nvm
. /root/.nvm/nvm.sh

set -ex

cd /mnt
bundle install
npm install

if [ $# -eq 0 ]; then
    make build
else
    make "$@"
fi
