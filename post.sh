#!/bin/bash

ssh-keygen -t rsa -b 4096 -C "i1007673219@gmail.com"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

git config --global user.email "i1007673219@gmail.com"
git config --global user.name "TsungYu HSIEH"
git config --global push.default simple

cp .vimrc .tmux.conf $HOME

mkdir $HOME/.vim/bundle -p
git clone git@github.com:VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd $HOME/.vim/bundle/YouCompleteMe/
./install.py --clang-completer
cd -

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo '' >> $HOME/.zshrc
echo 'alias py="python"' >> $HOME/.zshrc
echo 'alias py3="python3"' >> $HOME/.zshrc
echo 'alias sensors="watch -n 1 sensors"' >> $HOME/.zshrc
echo 'alias nvidia-smi="watch -n 1 nvidia-smi"' >> $HOME/.zshrc
echo 'alias gdb="gdb -q"' >> $HOME/.zshrc
echo 'alias diff="colordiff -u"' >> $HOME/.zshrc

echo 'export CLASSPATH="$CLASSPATH:."' >> $HOME/.zshrc
