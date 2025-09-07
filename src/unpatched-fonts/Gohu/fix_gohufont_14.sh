#!/usr/bin/env bash

set -e

cd 14
ttx gohufont-14.ttf
patch < gohufont-14.patch
mv gohufont-14.ttf gohufont-14_orig.tt_
ttx gohufont-14.ttx
rm gohufont-14.ttx
