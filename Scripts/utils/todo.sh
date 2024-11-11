#!/usr/bin/env sh

grep -r "todo" $(git rev-parse --show-toplevel)

