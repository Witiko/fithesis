#!/bin/sh
# This file reads the following sequence of lines from $1:
#
#   % History:
#   % ????/??/?? v?.??.?? (...)
#
# It then takes $1, replaces every occurance of %%%date%%% with ????/??/??,
# every occurance of %%%version%%% with ?.??.?? and every occurance of
# %%%year%%% with ???? and stores the result in $2.

LINE="$(head -n $(($(fgrep -n '% History:' "$1" | sed s/:.*//) + 1)) "$1" | tail -n 1)"
DATE="$(echo "$LINE" | sed 's#% \(..../../..\).*#\1#')"
YEAR="$(echo "$DATE" | head -c 4)"
VERSION="$(echo "$LINE" | sed 's#% ..../../.. v\([^ ]*\).*#\1#')"
echo "Generating file $2 for [$DATE fithesis3 version $VERSION MU thesis class]"
< "$1" sed s#%%%date%%%#$DATE#g\;s/%%%year%%%/$YEAR/g\;s/%%%version%%%/$VERSION/g > "$2"
