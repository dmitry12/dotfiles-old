#!/bin/bash

VIMRCPATH=/home/$USER/.vimrc

# Add awesome

function install_neobundle() {
	(
		if [ ! -d "/home/dmitry/.vim/bundle/neobundle.vim" ]; then
			cd
			curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | bash


			echo 'Done installing neobundle'
		fi
	)
}

function symlink() {
	(
		if [ ! -L $VIMRCPATH ]; then
			cd
			ln -s ~/dotfiles/.vimrc
			echo 'Done symlink'
		fi
	)

}

install_neobundle
symlink
