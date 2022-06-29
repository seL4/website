#!/bin/bash
#
# Copyright 2022, Proofcraft Pty Ltd
#
# SPDX-License-Identifier: BSD-2-Clause
#

case "$(uname -m)" in
    arm64)
        DOCKER="docker buildx build --platform linux/amd64"
        ;;
    *)
        DOCKER="docker build"
        ;;
esac

exec $DOCKER "$@"
