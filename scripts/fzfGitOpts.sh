#!/usr/bin/env bash
#{{{ MARK:Header
#**************************************************************
##### Author: MenkeTechnologies
##### GitHub: https://github.com/MenkeTechnologies
##### Date: Thu Sep  5 22:34:56 EDT 2019
##### Purpose: bash script to
##### Notes:
#}}}***********************************************************

#source "$SCRIPTS/fzfPreviewOptsCommon.sh"

cat<<EOF
    git diff --stat -p --color=always {}
EOF