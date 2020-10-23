#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

hostnamectl set-hostname vg-rundeck-debian
echo "192.168.50.16 vg-rundeck-debian.local vg-rundeck-debian" |sudo tee -a /etc/hosts
cat /etc/hosts

echo "nameserver 8.8.8.8" |sudo tee -a /etc/resolv.conf
cat /etc/resolv.conf

echo "===================================================================================="
                          hostnamectl status
echo "===================================================================================="
echo "         \   ^__^                                                                  "
echo "          \  (oo)\_______                                                          "
echo "             (__)\       )\/\                                                      "
echo "                 ||----w |                                                         "
echo "                 ||     ||                                                         "
echo "========================================================================================="

# https://docs.rundeck.com/docs/administration/install/linux-deb.html#rundeck-enterprise
# Open Source Rundeck

apt-get update -qq

# Install deb package directly
# Download deb package: http://rundeck.org/download/deb
# RUNDECK_VERSION="3.3.5.20201019-1_all"
# dpkg -i https://download.rundeck.org/deb/rundeck_3.3.5.20201019-1_all.deb
# wget https://download.rundeck.org/deb/rundeck_$RUNDECK_VERSION.deb
# dpkg -i rundeck_$RUNDECK_VERSION.deb

# https://docs.rundeck.com/downloads.html
apt-get install -qqy openjdk-8-jdk-headless
RUNDECK_VERSION="3.3.5.20201019-1_all"
wget -q https://download.rundeck.org/deb/rundeck_$RUNDECK_VERSION.deb
dpkg -i rundeck_3.3.5.20201019-1_all.deb

# Verify a supported java version is installed
java -version

# start Rundeck
service rundeckd start
# verify that the service started correctly, tail the logs
tail -n 40 /var/log/rundeck/service.log

# The service is ready once you see something similar to
# Grails application running at http://localhost:4440 in environment: production

# Navigate to http://localhost:4440/ in a browser.
# Log in with the username admin and password admin
curl http://127.0.0.1:4440/
curl -v http://localhost:4440/
curl http://localhost:4440/
curl http://vg-rundeck-debian.local:4440/