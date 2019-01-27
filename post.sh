#!/bin/bash

git config --global user.email "i1007673219@gmail.com"
git config --global user.name "Tsung-Yu HSIEH"
git config --global push.default simple
git config --global core.editor vim

cp .vimrc .tmux.conf $HOME

mkdir $HOME/.vim/bundle -p
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd $HOME/.vim/bundle/YouCompleteMe/
./install.py --clang-completer --go-completer
cd -

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo '' >> $HOME/.zshrc
echo 'alias py="python"' >> $HOME/.zshrc
echo 'alias py3="python3"' >> $HOME/.zshrc
echo 'alias sensors="watch -n 1 sensors"' >> $HOME/.zshrc
echo 'alias nvidia-smi="watch -n 1 nvidia-smi"' >> $HOME/.zshrc
echo 'alias gdb="gdb -q"' >> $HOME/.zshrc
echo 'alias diff="colordiff -u"' >> $HOME/.zshrc
echo 'alias gop="export GOPATH=`pwd`"' >> $HOME/.zshrc
