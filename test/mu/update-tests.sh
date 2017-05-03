#!/bin/sh
# Runs tests and updates any files that have changed.
exec 3>&1
(
  set -e
  make -C compare UPDATE_FAILED=true
  make -C compare-example UPDATE_FAILED=true
) 2>&1 1>&3 | grep -Ei 'error|does not contain page|differ in pages' >update-tests.log
