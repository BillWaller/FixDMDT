#!/bin/bash
# 01-ua-rm-dm.sh
# remove displaymanagers from update-alternatives
#
#
echo "#!/bin/bash
# run.sh
# reconstruct displaymanager and desktop links and
# entries in update-alternatives
#
# 01 - REMOVE DISPLAYMANAGER
# Source is update-alternatives" >run.sh
ua-get-dm() {
    update-alternatives --display default-displaymanager |
        grep "^[/]" |
        sed 's/\s.*//g'
}
for dm in $(ua-get-dm); do
    echo "update-alternatives --remove default-displaymanager $dm"
done >>run.sh
echo "#---------------------------------------------------------------" >>run.sh
chmod a+x run.sh
