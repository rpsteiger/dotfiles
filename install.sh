#!/bin/bash 
# sudo apt install -y tmux 

# install zap (zsh plugin manager)
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

if [ ! -d ~/.local/share/fonts ]
then
	mkdir -p ~/.local/share/fonts/Meslo
	cd ~
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip
	unzip Meslo.zip -d ~/.local/share/fonts/Meslo
	rm Meslo.zip
fi

# install tpm (tmux plugin manager)
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install my dotfiles
# cd 
# git clone git@github.com:rpsteiger/.dotfiles.git .dotfiles
# cd .dotfiles
# creating symlinks to .tmux.conf and .zshrc
if [ -e ~/.zshrc ]; then 
  echo "1"
  rm ~/.zshrc
fi

if [ -e ~/.tmux.conf ]; then
  echo "2"
  rm ~/.tmux.conf
fi
ln -s ~/.dotfiles/.linux-tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc

