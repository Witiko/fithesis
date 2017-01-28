#!/bin/sh
(
  set -e
  make -j 4 -C compare UPDATE_FAILED=true
  make -C compare-example UPDATE_FAILED=true
) 2>&1 | grep -Ei 'error|does not contain page|differ in pages'
