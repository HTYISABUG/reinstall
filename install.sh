#!/bin/bash

# url
CHROME_URL=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
GO_URL=https://dl.google.com/go/go1.11.linux-amd64.tar.gz
VIM_URL=https://github.com/vim/vim.git

# download
cd $HOME/Downloads
wget $CHROME_URL
wget $GO_URL
cd -

# apt
apt update -y
apt install git ssh xclip vim \
            ibus-chewing ibus-mozc \
            smplayer transmission htop \
            gcc g++ cmake python-dev python3-dev python3-pip \
            zsh powerline autojump tmux \
            lm-sensors colordiff \
            libncurses5-dev libgnome2-dev libgnomeui-dev \
            libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
            libcairo2-dev libx11-dev libxpm-dev libxt-dev -y
apt upgrade -y
apt autoremove -y

# dpkg
cd $HOME/Downloads
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
cd -

# go
cd $HOME/Downloads
tar -C /usr/local -xzf go1.11.linux-amd64.tar.gz
rm go1.11.linux-amd64.tar.gz
cd -
