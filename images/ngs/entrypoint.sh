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

export PATH=$PATH:/usr/local/mirdeep2/bin
export PERL5LIB=/usr/local/mirdeep2/lib/perl5
export PERL_MB_OPT="--install_base /home/user/perl5"
export PERL_MM_OPT="INSTALL_BASE=/home/user/perl5"

sudo /etc/init.d/ssh start
exec /usr/sbin/gosu user nohup jupyter lab --ip=0.0.0.0 --port 8888 --no-browser --NotebookApp.token='' > ~/jupyter.log 2> ~/jupyter.err &

if [ $# -eq 0 ]; then
    exec /usr/sbin/gosu user bash
else
    exec /usr/sbin/gosu user "$@"
fi
