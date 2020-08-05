#!/bin/bash 

set -ex

bash docker/snapshot.sh
bash docker/linkchecker.sh
