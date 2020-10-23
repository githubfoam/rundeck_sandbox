#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

hostnamectl set-hostname vg-rundeck-fedora
echo "192.168.50.17 vg-rundeck-ubuntu.local vg-rundeck-ubuntu" |sudo tee -a /etc/hosts
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

#  Install rpm package directly
# Download rpm package: http://rundeck.org/downloads.html 
# rpm -i rundeck-3.3.5-20201019-1.noarch.rpm
rpm -i rundeck-$RUNDECK_VERSION.noarch.rpm

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
curl http://vg-rundeck-fedora.local:4440/
curl http://127.0.0.1:4440/
curl -v http://localhost:4440/
curl http://localhost:4440/