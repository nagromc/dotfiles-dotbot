#!/usr/bin/env bash

set -e

# KeePassXC-Browser
keepassxcConfigFile="$HOME/.mozilla/firefox/default/browser-extension-data/keepassxc-browser@keepassxc.org/storage.js"
keepassxcConfigDir=$(dirname "$keepassxcConfigFile")
mkdir -p "$keepassxcConfigDir"
if ! [ -f "$keepassxcConfigFile" ]; then
    echo "{}" > "$keepassxcConfigFile"
fi
jq '.settings.usePasswordGenerator = false |
    .settings."defined-custom-fields"."https://login.microsoftonline.com" = {username: "i0116", password: null, fields: []} |
    .settings."defined-custom-fields"."https://accounts.google.com" = {username: "identifierId", password: null, fields: []}' "$keepassxcConfigFile" | sponge "$keepassxcConfigFile"
