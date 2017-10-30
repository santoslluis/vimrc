#!/bin/bash

export INSTALL_DIR=$HOME
export VIMRC_LOCATION=$INSTALL_DIR/.vimrc
export VIM_DIR=$INSTALL_DIR/.vim

uninstall(){
	rm $VIMRC_LOCATION -f 2> /dev/null
	rm $VIM_DIR -rf 2> /dev/null
}

forceinstall(){
	uninstall
	install
}
reinstall(){
	forceinstall
}

install(){
	cp -r $PWD/.vimrc $PWD/.vim $INSTALL_DIR
}

echo "Trying to install vim config into $INSTALL_DIR"
if test -f $VIMRC_LOCATION || test -d $VIM_DIR;then
	echo "Warning: vim config files already present ($VIMRC_LOCATION or $VIM_DIR)"
	read -p "Do you want to replace it? (yes/*): " replace
	if [[ "$replace" == "yes" ]];then
		forceinstall
	else
		echo "Installation aborted."
		exit 1
	fi
else
	install
fi

