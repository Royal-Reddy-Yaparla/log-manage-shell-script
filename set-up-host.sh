#!/bin/bash

# Setup Hostname
hostnamectl set-hostname "$1"

# Refresh
/bin/bash

# Update the hostname part of Host File
echo "`hostname -I | awk '{ print $1 }'` `hostname`" >> /etc/hosts

# Back to normal user
exit