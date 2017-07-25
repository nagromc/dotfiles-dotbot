#!/bin/bash

PACKAGES_LIST_FILENAME="package-list"
BASEDIR=$(dirname $0)
PACKAGES_LIST_PATH="$BASEDIR"/"$PACKAGES_LIST_FILENAME"
APM_CMD="apm"

command -v $APM_CMD >/dev/null 2>&1 || {
    echo >&2 "$APM_CMD is required but it's not installed. Please install it before installing these awesome packages.";
    exit 1;
}

apm install --production --packages-file "$PACKAGES_LIST_PATH"
