#!/bin/bash
curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get update
echo =============================================
echo We're going to install puppet master
echo =============================================
    apt-get install -y puppetserver
echo =============================================
COMMAND=nope
while [ "$COMMAND" != "end" ]
do
    echo =============================================
    echo Now run client.sh on client device. Press [ENTER] to complete authorization, when it will be asked from client.
    echo =============================================
        COMMAND=`read`
    echo =============================================
    echo Client device authorization
    echo =============================================
    puppet cert sign --all
done  
