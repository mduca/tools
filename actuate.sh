#!/bin/bash

# TODO
# check for git
# download .dotfiles repo
# move .vimrc .tmux.conf .dircolors
# install pathogen
# setup vim plugins

if hash git 2>/dev/null; then
  echo "Cloning repos and plugins...."
  git clone http://github.com/mduca/.dotfiles.git /home/$USER/.dotfiles

  ln -s /home/$USER/.dotfiles/vimrc /home/$USER/.vimrc
  ln -s /home/$USER/.dotfiles/bashrc /home/$USER/.bashrc
  ln -s /home/$USER/.dotfiles/tmux.conf /home/$USER/.tmux.conf
  ln -s /home/$USER/.dotfiles/dircolors /home/$USER/.dircolors
  ln -s /home/$USER/.dotfiles/irbrc /home/$USER/.irbrc 
  ln -s /home/$USER/.dotfiles/gemrc /home/$USER/.gemrc 

  mkdir /home/$USER/.vim
  mkdir -p /home/$USER/.vim/autoload /home$USER/.vim/bundle

  curl -LSso /home/$USER/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  git clone https://github.com/scrooloose/nerdtree.git /home/$USER/.vim/bundle/nerdtree
  git clone https://github.com/tpope/vim-surround.git /home/$USER/.vim/bundle/surround
  git clone https://github.com/tpope/vim-rails.git /home/$USER/.vim/bundle/rails
  git clone https://github.com/Lokaltog/vim-easymotion /home/$USER/.vim/bundle/vim-easymotion
  git clone https://github.com/ervandew/supertab.git /home/$USER/.vim/bundle/supertab
  git clone https://github.com/scrooloose/syntastic.git /home/$USER/.vim/bundle/syntastic

  clear
  source /home/$USER/.bashrc
  echo "Actuated..."

else
  echo "Cannot find git!"
fi
