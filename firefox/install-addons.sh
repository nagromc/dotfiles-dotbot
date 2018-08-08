#!/usr/bin/env bash

addonsId=""

# DuckDuckGo Privacy Essentials - https://addons.mozilla.org/firefox/addon/duckduckgo-for-firefox/
addonsId="$addonsId 880103"
# Firefox Multi-Account Containers - https://addons.mozilla.org/firefox/addon/multi-account-containers/
addonsId="$addonsId 872069"
# First Party Isolation - https://addons.mozilla.org/firefox/addon/first-party-isolation/
addonsId="$addonsId 792833"
# KeePassXC-Browser - https://addons.mozilla.org/firefox/addon/keepassxc-browser/
addonsId="$addonsId 881663"
# Kimetrak - https://addons.mozilla.org/firefox/addon/kimetrak/
addonsId="$addonsId 941867"
# HTTPS Everywhere - https://addons.mozilla.org/firefox/addon/https-everywhere/
addonsId="$addonsId 875902"
# Privacy Badger - https://addons.mozilla.org/firefox/addon/privacy-badger17/
addonsId="$addonsId 855336"
# Proxy SwitchyOmega - https://addons.mozilla.org/firefox/addon/switchyomega/
addonsId="$addonsId 848109"


# by default, we assume firefox is in PATH
firefoxPath="firefox"

if [[ "$#" -gt 1 ]]; then
    echo "Usage: $0 [firefoxpath]"
    echo "    firefoxpath: The path to the Firefox binary. Default : $firefoxPath"
    exit
fi

if [[ -n "$1" ]]; then
    if [[ ! -f "$1" && ! -x "$1" ]]; then
        echo "firefoxpath needs to be an executable file."
        exit
    fi
    firefoxPath="$1"
fi


addonsBaseUrl="https://addons.mozilla.org/firefox/downloads/file/"
addonsUrlList=""
for id in $addonsId; do
    addonsUrlList="$addonsUrlList $addonsBaseUrl$id"
done

# shellcheck disable=SC2086
"$firefoxPath" $addonsUrlList
