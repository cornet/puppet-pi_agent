#!/bin/bash

set -e

echo ""
echo " ***********************************"
echo " * Stato Bootstrap...              *"
echo " ***********************************"
echo ""

echo " * Disabling raspi-config..."
if [ -e /etc/profile.d/raspi-config.sh ]; then
  rm -f /etc/profile.d/raspi-config.sh
  sed -i /etc/inittab \
    -e "s/^#\(.*\)#\s*RPICFG_TO_ENABLE\s*/\1/" \
    -e "/#\s*RPICFG_TO_DISABLE/d"
  telinit q
fi

echo " * Updating apt-get..."
apt-get update --fix-missing
echo ""

echo " * Installing puppet..."
apt-get install -y puppet rsync
echo ""
