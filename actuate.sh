#!/bin/bash

# TODO
# check for git
# download .dotfiles repo
# move .vimrc .tmux.conf .dircolors
# install pathogen
# setup vim plugins


if hash git 2>/dev/null; then
  echo "Cloning repos and plugins...."
  git clone http://github.com/mduca/.dotfiles.git ~/.dotfiles

  ln -s ~/.dotfiles/vimrc ~/.vimrc
  ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
  ln -s ~/.dotfiles/dircolors ~/.dircolors
  ln -s ~/.dotfiles/irbrc ~/.irbrc 

  mkdir ~/.vim
  mkdir -p ~/.vim/autoload ~/.vim/bundle

  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
  git clone https://github.com/tpope/vim-surround.git ~/.vim/bundle/surround
  git clone https://github.com/tpope/vim-rails.git ~/.vim/bundle/rails
  git clone https://github.com/Lokaltog/vim-easymotion ~/.vim/bundle/vim-easymotion
  git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
  git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

  clear
  source ~/.bashrc
  echo "Actuated..."

else
  echo "git not exists"
fi
