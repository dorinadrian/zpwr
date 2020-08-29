#!/usr/bin/env bash
#{{{                    MARK:Header
#**************************************************************
##### Author: MenkeTechnologies
##### GitHub: https://github.com/MenkeTechnologies
##### Date: Sat Aug 29 00:34:22 EDT 2020
##### Purpose: bash script to
##### Notes:
#}}}***********************************************************

if ! type -- "exists" >/dev/null 2>&1;then
    test -z "$ZPWR" && export ZPWR="$HOME/.zpwr"
    test -z "$ZPWR_ENV_FILE" && export ZPWR_ENV_FILE="$ZPWR/.zpwr_env.sh"
    test -z "$ZPWR_RE_ENV_FILE" && export ZPWR_RE_ENV_FILE="$ZPWR/.zpwr_re_env.sh"
    if source "$ZPWR_ENV_FILE"; then
        logg "loaded ZPWR_ENV_FILE '$ZPWR_ENV_FILE'"
    else
        echo "cannot source ZPWR_ENV_FILE '$ZPWR_ENV_FILE'" >&2
        exit 1
    fi

    if test -f "$ZPWR_TOKEN_PRE"; then
        if source "$ZPWR_TOKEN_PRE"; then
            logg "loaded ZPWR_TOKEN_PRE '$ZPWR_TOKEN_PRE'"
        else
            loggErr "could not source ZPWR_TOKEN_PRE '$ZPWR_TOKEN_PRE'"
        fi
    else
        touch "$ZPWR_TOKEN_PRE"
    fi

    if source "$ZPWR_RE_ENV_FILE"; then
        logg "loaded ZPWR_RE_ENV_FILE '$ZPWR_RE_ENV_FILE'"
    else
        loggErr "where is ZPWR_RE_ENV_FILE '$ZPWR_RE_ENV_FILE'"
        exit 1
    fi

    if test -f "$ZPWR_TOKEN_POST"; then
        if source "$ZPWR_TOKEN_POST"; then
            logg "loaded ZPWR_TOKEN_POST '$ZPWR_TOKEN_POST'"
        else
            loggErr "could not source ZPWR_TOKEN_POST '$ZPWR_TOKEN_POST'"
        fi
    else
        touch "$ZPWR_TOKEN_POST"
    fi

fi