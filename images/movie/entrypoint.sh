#!/bin/bash

user_id=${USER_ID:-1000}
group_id=${GROUP_ID:-1000}
password=${PASSWORD:-pass}

echo "Starting with UID: $user_id, GID: $group_id"
echo "IP address: `hostname -i`"

echo "root:$password" | chpasswd
useradd -u $user_id -o -m user
groupmod -g $group_id user
echo "user:$password" | chpasswd
echo "%user    ALL=(ALL)    NOPASSWD:    ALL" >> /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user
export HOME=/home/user
echo "export PS1='[docker \h \W]\$ '" >> $HOME/.bashrc

chown user:user /out
cd /out

if [ $# -eq 0 ]; then
    exec /usr/sbin/gosu user bash
else
    exec /usr/sbin/gosu user dl "$@"
fi
