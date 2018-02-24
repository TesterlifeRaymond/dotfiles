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
red='\033[0;31m'  
light_red='\033[1;31m'  
end='\033[0m'  

echo -e $purple"AUTHOR: "$end$light_purple"liujinjia"$end
echo -e $purple"EMAIL: "$end$light_purple"liujinjia@testerlife.com"$end
echo -e $purple"WEBSITE: "$end$light_purple"http://testerlife.com/"$end
echo -e $purple"GITHUB: "$end$light_purple"https://github.com/TesterlifeRaymond/"$end

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

# setup symlink
if [ -d $DOTFILES_HOME'/dotfiles' ]
then
	for file in $DOTFILES_HOME/dotfiles/*
	do

		target='.'$(basename $file)
		if [ ! -L $target -o ! -r $target ]
		then
			ln -fs $file $target
			echo -e $cyan"Setup Symlinks: "$end$light_cyan$HOME'/'$target$end
		else
			echo -e $red"Skip File:"$end$light_red$HOME'/'$target$end"\c"
			echo -e "\033[1m (You may need to link it manually)\033[0m"
		fi
	done
fi

