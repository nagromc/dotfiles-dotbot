#!/usr/bin/env sh

# Replace current user.js with user-defaults.js containing some default values.
# Useful when a website is broken because of customized security and privacy-related options.
# See :
# - https://feeding.cloud.geek.nz/posts/tweaking-cookies-for-privacy-in-firefox/
# - https://feeding.cloud.geek.nz/posts/tweaking-referrer-for-privacy-in-firefox/


set -e

BASEDIR=$(dirname $0)
USERJS="user.js"
USERJSDEF="user-defaults.js"
USERJSBUP=".user.js.bup"


# if a backup file doesn't exist, we can toggle the files
if ! [ -f "$BASEDIR/$USERJSBUP" ]; then
    mv $BASEDIR/$USERJS $BASEDIR/$USERJSBUP
    cp $BASEDIR/$USERJSDEF $BASEDIR/$USERJS
    echo "Toggled $USERJS and $USERJSDEF. Original configuration saved to $USERJSBUP."
    return
# otherwise, restore original conf file
else
    mv $BASEDIR/$USERJSBUP $BASEDIR/$USERJS
    echo "Restored original $USERJS."
    return
fi
