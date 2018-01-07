#!/bin/bash
# change following varibles to comply your envronment
MASTER_IP=192.168.0.100
SERVER_NAME=server
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get update
echo =============================================
echo ID generation
echo =============================================
    apt-get install -y uuid
    ID=`uuid`
    echo $MASTER_IP $SERVER_NAME >> /etc/hosts
echo =============================================
echo Puppet agent instalation
echo =============================================
    apt-get install -y puppet-agent
echo =============================================
echo Configuration
echo =============================================
    cat >> /etc/puppet/puppet.conf << EOF
[agent]
server = $SERVER_NAME
node_name = cert
certname = workstation-$ID
EOF
echo =============================================
echo Sending certificate to server
echo =============================================
    /opt/puppetlabs/bin/puppet agent --test
echo =============================================
echo Authorize client device on master and press [ENTER], to complete installation and configuration
echo =============================================
    read -n 1
echo =============================================
echo Wrapping up...
echo =============================================
    systemctl start puppet
    systemctl enable puppet
    /opt/puppetlabs/bin/puppet agent --test
echo =============================================
echo All done.
echo =============================================
