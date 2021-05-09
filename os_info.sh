#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  source /etc/os-release
fi

ARCH=$(uname -m)

OS_ID=1
OS_FOLDER="${PRETTY_NAME}/${VERSION_ID}/${ARCH}/${OS_ID}"

while [[ -d "$OS_FOLDER" ]]
do
  OS_ID=`expr $OS_ID + 1`
  OS_FOLDER="${PRETTY_NAME}/${VERSION_ID}/${ARCH}/${OS_ID}"
done

echo "$OS_FOLDER"

mkdir -p "$OS_FOLDER"

# /etc/os-release
echo "## /etc/os-release"
[ -f /etc/os-release ] && cat /etc/os-release > "$OS_FOLDER/etc_os-release"

# /etc/issue
echo "## /etc/issue"
[ -f /etc/issue ] && cat /etc/issue > "$OS_FOLDER/etc_issue"

# /proc/version
echo "## /proc/version"
[ -f /proc/version ] && cat /proc/version > "$OS_FOLDER/proc_version"

# /etc/lsb-release
echo "## /etc/lsb-release"
[ -f /etc/lsb-release ] && cat /etc/lsb-release > "$OS_FOLDER/etc_lsb-release"

# uname -a
echo "## uname -a"
echo $(uname -a) > "$OS_FOLDER/uname_a"

# uname -r
echo "## uname -r"
echo $(uname -r) > "$OS_FOLDER/uname_r"

# lsb_release -a
echo "## lsb_release -a"
echo $(lsb_release -a) > "$OS_FOLDER/lsb_release_a"

# /etc/redhat-release
echo "## /etc/redhat-release"
[ -f /etc/redhat-release ] && cat /etc/redhat-release > "$OS_FOLDER/etc_redhat-release"