#!/bin/bash

# after run the scripts,
# the `first/` and `second/` directories were renamed to `phase1/` and `phase2/` respectively

find imgs/ -type d -name "first" -execdir mv {} phase1 \;
find imgs/ -type d -name "second" -execdir mv {} phase2 \;
