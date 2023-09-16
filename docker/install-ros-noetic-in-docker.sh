#!/bin/bash

echo ""
echo "#######################################################################################################################"
echo ">>> update apt repo and upgrade, install git vim nano neovim and config $TERM ,then install keyboard-configuration"
echo ""
echo "#######################################################################################################################"
sudo apt update
sudo apt upgrade
sudo apt install -f git vim nano neovim
export TERM=xterm
sudo apt install -f keyboard-configuration

echo ""
echo "#######################################################################################################################"
echo ">>> install vscode from offcial"
echo ""
echo "#######################################################################################################################"

wget https://az764295.vo.msecnd.net/stable/abd2f3db4bdb28f9e95536dfa84d8479f1eb312d/code_1.82.2-1694671812_amd64.deb
sudo apt install -f ./code_1.82.2-1694671812_amd64.deb

echo ""
echo "#######################################################################################################################"
echo ">>> install libpcl-dev libopencv-dev libeigen3-dev libboost-all-dev from apt"
echo ""
echo "#######################################################################################################################"

sudo apt install -f libpcl-dev libopencv-dev libeigen3-dev libboost-all-dev

echo ""
echo "#######################################################################################################################"
echo ">>> install lazygit from github"
echo ""
echo "#######################################################################################################################"

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

curl https://raw.githubusercontent.com/qboticslabs/ros_install_noetic/master/ros_install_noetic.sh | bash
