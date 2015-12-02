#!/bin/sh

# Install the version of Unity uploaded by the file provisioner

# Expects : unity.dmg to be present and be the correct version of XCode
# TODO : Upload the files to S3 instead of ../input and download them when needed
installer -pkg /tmp/unity.pkg -target /
rm /tmp/unity.pkg
exit
