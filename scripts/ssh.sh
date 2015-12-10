#!/bin/sh
echo "Installing SSH keys for $USERNAME user"
mkdir -p "/Users/$USERNAME/.ssh"
chmod 700 "/Users/$USERNAME/.ssh"

cp /private/tmp/bitbucket /Users/$USERNAME/.ssh/

chmod 600 "/Users/$USERNAME/.ssh/*"
chown -R "$USERNAME" "/Users/$USERNAME/.ssh"

