#!/bin/sh
# This script finds the latest occurance of a \changes command (sorted by
# the version number) in "$1" and parses the VERSION and DATE out of it:
#
#   \changes{vVERSION}{DATE} (important: must be on the same line)
#
# It then takes $1, replaces every occurance of %%%date%%% with ????/??/??,
# every occurance of %%%version%%% with ?.??.?? and every occurance of
# %%%year%%% with ???? and stores the result in $2.

REGEX='.*\(\\changes\s*{v\([^}]*\)}\s*{\([^}]*\)}\).*'
LINE="$(grep "$REGEX" "$1" | sed s/"$REGEX"/\\1/ | sort -Vr | head -n 1)"
VERS="$(printf '%s' "$LINE" | sed s/"$REGEX"/\\2/)"
DATE="$(printf '%s' "$LINE" | sed s/"$REGEX"/\\3/)"
YEAR="$(printf '%s' "$DATE" | head -c 4)"

echo "Generating file $2 for [$DATE fithesis3 version $VERS MU thesis class]"
< "$1" sed s#%%%date%%%#$DATE#g\;s/%%%year%%%/$YEAR/g\;s/%%%version%%%/$VERS/g > "$2"
