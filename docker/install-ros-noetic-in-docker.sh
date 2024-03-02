#!/bin/bash

echo ""
echo "#######################################################################################################################"
echo ">>> update apt repo and upgrade, install git vim nano neovim inetutils-ping and config TERM ,then install keyboard-configuration"
echo ""
echo "#######################################################################################################################"
sudo apt update
sudo apt upgrade
read -p "Do you want to install git vim nano neovim inetutils-ping? [y/n]" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	sudo apt install -y git vim nano neovim inetutils-ping
fi
read -p "Do you want to export TERM=xterm and install keyboard-configuration? [y/n]" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	export TERM=xterm
	sudo apt install -y keyboard-configuration
fi

echo ""
echo "#######################################################################################################################"
echo ">>> install lsb-release wget curle from apt"
echo ""
echo "#######################################################################################################################"

read -p "Do you want to install lsb-releasae software-properties-common? [y/n](in docker ubuntu20.04 it doesn't installed)" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	sudo apt install -y lsb-release wget curl
	sudo apt install --reinstall -y software-properties-common
fi

echo ""
echo "#######################################################################################################################"
echo ">>> install vscode from offcial"
echo ""
echo "#######################################################################################################################"

read -p "Do you want to install vscode? [y/n]" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	wget https://az764295.vo.msecnd.net/stable/abd2f3db4bdb28f9e95536dfa84d8479f1eb312d/code_1.82.2-1694671812_amd64.deb
	sudo apt install -y ./code_1.82.2-1694671812_amd64.deb
fi
read -p "Do you want to remove vscode.deb? [y/n]" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	sudo rm ./code_1.82.2-1694671812_amd64.deb
fi

echo ""
echo "#######################################################################################################################"
echo ">>> install libpcl-dev libopencv-dev libeigen3-dev libboost-all-dev from apt"
echo ""
echo "#######################################################################################################################"

read -p "Do you want to install those packages? [y/n]" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	sudo apt install -y libpcl-dev libopencv-dev libeigen3-dev libboost-all-dev
fi

echo ""
echo "#######################################################################################################################"
echo ">>> install lazygit from github"
echo ""
echo "#######################################################################################################################"

read -p "Do you want to install lazygit? [y/n]" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
fi
read -p "Do you want to remove lazygit cache? [y/n]" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	sudo rm lazygit lazygit.tar.gz
fi

echo ""
echo "#######################################################################################################################"
echo ">>> install ros noetic use the install script from github"
echo ""
echo "#######################################################################################################################"
read -p "Do you want to install ros noetic use the install script? [y/n]" answer
#Default answer is y
answer=${answer:-y}
if [ $answer == "y" ]; then
	wget -c https://raw.githubusercontent.com/qboticslabs/ros_install_noetic/master/ros_install_noetic.sh && chmod +x ./ros_install_noetic.sh && ./ros_install_noetic.sh
	user_name=$(whoami)
	sed -i '/source \/opt\/ros\/noetic\/setup.bash/d' /home/$user_name/.bashrc
	echo "if [ -f /usr/bin/rosdep ]; then" >> /home/$user_name/.bashrc
	echo "  source /opt/ros/noetic/setup.bash" >> /home/$user_name/.bashrc
	echo "  export ROS_HOSTNAME=localhost" >> /home/$user_name/.bashrc
	echo "  export ROS_MASTER_URI=http://localhost:11311" >> /home/$user_name/.bashrc
	echo "fi" >> /home/$user_name/.bashrc
fi


echo ""
echo "#######################################################################################################################"
echo "you should do this cmd:' source ~/.bashrc ' manually"
echo "you can exec those cmd to test it work"
echo "roscore"
echo "rosrun turtlesim turtlesim_node"
echo "rosrun turtlesim turtle_teleop_key"
echo ""
echo ""please rm this script by youself manually
echo "#######################################################################################################################"
