#!/bin/bash 

# color init
blue='\033[0;34m'  
light_blue='\033[1;34m'  
green='\033[0;32m'  
light_green='\033[1;32m'  
cyan='\033[0;36m'  
light_cyan='\033[1;36m'  
purple='\033[0;35m'  
light_purple='\033[1;35m'  
yellow='\033[0;33m'  
light_yellow='\033[1;33m'  
end='\033[0m'  

echo -e $purple"AUTHOR: "$end$light_purple"Cano"$end
echo -e $purple"EMAIL: "$end$light_purple"gcanoxl@gmail.com"$end
echo -e $purple"WEBSITE: "$end$light_purple"http://cano.xyz/"$end
echo -e $purple"GITHUB: "$end$light_purple"https://github.com/gcanoxl/"$end

DOTFILES_HOME=$(cd "$(dirname "$0")"; pwd)
echo -e $blue"DOTFILES_PATH: "$end$light_blue$DOTFILES_HOME$end

cd $HOME

# oh-my-zsh
OH_MY_ZSH=$DOTFILES_HOME'/oh-my-zsh'
if [ ! -d $OH_MY_ZSH ]
then

	echo -e ${yellow}"Installing Oh-My-Zsh..."
	git clone https://github.com/robbyrussell/oh-my-zsh.git $OH_MY_ZSH
	echo -e ${end}${light_yellow}"Done!"${end}
fi

# tmux plugin manager
TPM=$DOTFILES_HOME'/tpm'
if [ ! -d $TPM ]
then
	echo -e ${yellow}"Installing Tmux Plugin Manager..."
	git clone https://github.com/tmux-plugins/tpm $TPM
	echo -e ${end}${light_yellow}"Done!"${end}
fi

# setup symlink
echo -e $cyan"Setup Symlinks: "$end
if [ -d $DOTFILES_HOME'/dotfiles' ]
then
	for file in $DOTFILES_HOME/dotfiles/*
	do
		echo -e $light_cyan"        \c"

		target='.'$(basename $file)
		ln -fs $file $target
		echo -e $HOME'/'$target$end
	done
fi

