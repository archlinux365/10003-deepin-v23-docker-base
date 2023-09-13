#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color
echo $PROJECT_NAME
cd $CMD_PATH
env



cat /etc/passwd
groupadd runner
groupadd www
useradd -m -d /home/runner -G sudo -g runner runner -s /bin/bash
useradd -m -d /home/www -G sudo -g www www -s /bin/bash


mkdir -p /etc/sudoers.d
echo "www ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/root-nopassword
echo "runner ALL=(ALL) NOPASSWD: ALL"   > /etc/sudoers.d/runner-nopassword
chmod 750 /etc/sudoers.d/www-nopassword
chmod 750 /etc/sudoers.d/runner-nopassword
chmod 750 /etc/sudoers.d/
cat /etc/passwd




cd /root/
rm -rf versions
mkdir versions
cd versions
apt update -y
curl --insecure -fsSL https://code.midoks.me/midoks/mdserver-web/raw/branch/dev/scripts/install_dev.sh | bash > mdserver-web.txt
apt list > apt.list.origin.txt
apt list --installed > apt.list.installed.origin.txt

