#!/bin/sh

apt-get install git
apt-get install vim

git clone https://github.com/broxigarchen/my-vimrc /usr/share/vimrc_brox
cp /usr/share/vimrc_brox/vimrc ~/.vim/vimrc
rm -rf /usr/share/vimrc_brox

git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
apt-get install exuberant-ctags
