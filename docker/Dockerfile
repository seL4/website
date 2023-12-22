#
# Copyright 2023, Proofcraft Pty Ltd
#
# SPDX-License-Identifier: BSD-2-Clause
#

# This Dockerfile is expected to built from the context of the whole repo, e.g.:
#    docker build -t sel4/sel4-website -f docker/Dockerfile .
FROM debian:12-slim

RUN apt-get update && apt-get install -y bash make ruby bundler

ENV LANG=C.UTF-8

COPY docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
