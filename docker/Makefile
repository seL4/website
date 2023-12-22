#
# Copyright 2023, Proofcraft Pty Ltd
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

TAG=sel4/sel4-website

preview: docker-build
	cd ..; docker run -p 4000:4000 -v `pwd`:/mnt -ti $(TAG) SERVE_HOST="--host 0.0.0.0" serve

build: docker-build
	cd ..; docker run -v `pwd`:/mnt -ti $(TAG)

docker-build:
	cd ..; docker build -t $(TAG) -f docker/Dockerfile .
