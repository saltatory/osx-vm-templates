#!/bin/sh

# Expects : xcode.dmg to be present and be the correct version of XCode
# TODO : Upload the files to S3 instead of ../input and download them when needed

# Mount the installer image
TOOLS=/tmp/xcode.dmg
TMPMOUNT=`/usr/bin/mktemp -d /tmp/clitools.XXXX`
hdiutil attach "$TOOLS" -mountpoint "$TMPMOUNT"
cp -R "$TMPMOUNT"/Xcode.app /Applications

# Accept the license agreement
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -license accept

find /Applications/Xcode.app -name '*\.pkg' | while read package ; do installer -pkg $package -target / ; done

# Unmount and cleanup
hdiutil detach "$TMPMOUNT"
rm -rf "$TMPMOUNT"
rm "$TOOLS"
exit
