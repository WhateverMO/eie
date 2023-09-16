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
echo "please rm this script by youself manually"
echo "#######################################################################################################################"
distrobox enter ${name} -- echo "wget -c https://raw.githubusercontent.com/WhateverMO/eie/master/docker/install-ros-noetic-in-docker.sh -O install_noetic.sh && chmod +x ./install_noetic.sh && ./install_noetic.sh" 
distrobox enter ${name} 
