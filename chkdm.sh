#!/bin/bash
# 01-chkdm.sh
# check displaymanagers in update-alternatives
#
#
echo "#!/bin/bash
# run.sh
# reconstruct displaymanager and desktop links and
# entries in update-alternatives
#
# 01 - CHECK DISPLAYMANAGER
# Source is update-alternatives" >run.sh
ua-get-dm() {
    update-alternatives --display default-displaymanager
}

ua-get-dm
