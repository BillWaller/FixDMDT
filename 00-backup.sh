#!/bin/bash
# 00-backup.sh
#
# This script makes a backup of your update alternatives data in the current
# directory under ua-backups
#
# WARNING: Do not run this script after running any of the other scripts 01
# throug 08 because it will overwrite the backup files
#
mkdir -p ua-backups
cp -pdu /var/lib/alternatives/default-displaymanager \
    /var/lib/alternatives/default-waylandsession.desktop \
    /var/lib/alternatives/default-xsession-desktop \
    /var/lib/alternatives/default-xsession.desktop \
    ua-backups
