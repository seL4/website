#
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

TAG=sel4/sel4-website

preview: build
	cd ..; docker run -p 8080:80 -v `pwd`:/mnt -ti --entrypoint bash $(TAG) /mnt/docker/run-local.sh

build:
	cd ..; docker/build.sh -t $(TAG) -f docker/Dockerfile .
