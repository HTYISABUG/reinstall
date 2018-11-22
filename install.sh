#!/bin/bash

# url
DOWNLOADS=$HOME/Downloads
CHROME_URL=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
VIM_URL=https://github.com/vim/vim.git

# download
wget $CHROME_URL -P $DOWNLOADS

# apt
apt update -y
apt install git ssh xclip vim \
            ibus-chewing ibus-mozc \
            smplayer transmission htop \
            gcc g++ cmake python-dev python3-dev python3-pip golang \
            zsh powerline autojump tmux \
            lm-sensors colordiff \
            libncurses5-dev libgnome2-dev libgnomeui-dev \
            libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
            libcairo2-dev libx11-dev libxpm-dev libxt-dev -y
apt upgrade -y
apt autoremove -y

# dpkg
dpkg -i $DOWNLOADS/google-chrome-stable_current_amd64.deb
rm $DOWNLOADS/Downloads/google-chrome-stable_current_amd64.deb
