#!/bin/bash

echo ""
echo "#######################################################################################################################"
echo ">>> create a distrobox"
echo ""
echo ">>> please give a distrobox cantainer name which for ros neotic"
echo ""
echo "#######################################################################################################################"
distrobox ls
read -p "Enter name(Default is ros_noetic):" name

if [ -z "$name" ]
then
	name="ros_noetic"
fi

distrobox create -n ${name} -i ubuntu:20.04

echo ""
echo "#######################################################################################################################"
echo ">>> enter distrobox and you should copy end line to exec..."
echo ""
echo "#######################################################################################################################"
distrobox enter ${name} -- echo "curl https://raw.githubusercontent.com/WhateverMO/eie/master/docker/install-ros-noetic-in-docker.sh | bash" 
distrobox enter ${name} 
