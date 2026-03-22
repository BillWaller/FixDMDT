#!/bin/bash
# 07-ua-in-xdt-1.sh
# X DESKTOP
#

echo "# 07 - PREPARE X DESKTOPS FOR INSTALLATION
# Source is /usr/share/xsessions
# Output -s xdt.lst" >>run.sh
X_DESKTOPS=/usr/share/xsessions
find "$X_DESKTOPS" -type f -print | sed 's/$/ 0/' >xdt.out 2>/dev/null
rc=$?
if [ "$rc" != "0" ]; then
    echo find returned error $rc
    exit 1
fi
if [ ! -s dms.lst ]; then
    echo no displaymanagers found in "$X_DESKTOPS"
    exit 1
fi
cat xdt.out >xdt.lst
vi xdt.lst
echo "#---------------------------------------------------------------" >>run.sh
