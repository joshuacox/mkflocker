#!/bin/bash
cat <<EOF > /tmp/apt-pref
Package: *
Pin: origin clusterhq-archive.s3.amazonaws.com
Pin-Priority: 700
EOF
sudo mv /tmp/apt-pref /etc/apt/preferences.d/buildbot-700
