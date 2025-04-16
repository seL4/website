#
# Copyright 2023, Proofcraft Pty Ltd
#
# SPDX-License-Identifier: BSD-2-Clause
#

# This Dockerfile is expected to built from the context of the whole repo, e.g.:
#    docker build -t sel4/sel4-website -f docker/Dockerfile .
FROM debian:12-slim
ARG NODE_VERSION

RUN apt-get update && apt-get install -y bash make ruby bundler curl

ENV LANG=C.UTF-8

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
# set env
ENV NVM_DIR=/root/.nvm
# install node
RUN bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION"

COPY docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
