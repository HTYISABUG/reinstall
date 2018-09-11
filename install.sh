#!/bin/bash

# url
CHROME_URL=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# download
cd $HOME/Downloads
wget $CHROME_URL
cd -

# apt
apt update -y
apt install vim-gnome-py2 git ssh xclip -y
apt install ibus-chewing ibus-mozc -y
apt install smplayer transmission htop cscope -y
apt install gcc g++ cmake python-dev python3-dev python-pip python3-pip -y
apt install zsh powerline autojump tmux -y
apt install lm-sensors colordiff -y
apt upgrade -y
apt autoremove -y

# dpkg
cd $HOME/Downloads
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
cd -
