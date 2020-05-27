#!/bin/sh


git clone https://github.com/broxigarchen/my-vimrc ~/vimrc_brox
cp ~/vimrc_brox/vimrc ~/.vim/vimrc
rm -rf ~/vimrc_brox

git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
