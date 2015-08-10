#!/usr/bin/env bash

if [ "$(uname -s)" == "Darwin" ]
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install automake autoconf cmake python openssl ssh-copy-id \
        git git-review subversion tmux screen astyle ctags global tree \
        vim wget the_silver_searcher trash
else
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo add-apt-repository -y ppa:saiarcot895/myppa
    sudo add-apt-repository -y ppa:rabbitvcs/ppa
    sudo apt-get update
    sudo apt-get install -y build-essential g++-multilib cmake clang \
        gnupg flex bison gperf automake autoconf lib32ncurses5-dev \
        zlib1g-dev libc6-dev ssh git-core subversion curl p7zip-full zip \
        tmux screen ctags global dos2unix colordiff indent astyle tree \
        aptitude sysv-rc-conf silversearcher-ag trash-cli aria2 apt-fast \
        wine ibus-chewing filezilla meld vlc rabbitvcs-nautilus3
        skype google-chrome-stable qpdfview oracle-java8-installer
    sudo apt-get install oracle-java8-set-default
fi

cd $HOME
git clone https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles

cd $HOME/.dotfiles
git clone https://github.com/vincenthsu/dotfiles-private-config-example.git private
sed -i 's/https\:\/\/github.com\/vincenthsu\/dotfiles.git/git@github.com\:vincenthsu\/dotfiles.git/g' $HOME/.dotfiles/.git/config
sed -i 's/https\:\/\/github.com\/vincenthsu\/vimrc.git/git@github.com\:vincenthsu\/vimrc.git/g' $HOME/.dotfiles/.git/modules/link/.vim/config
sed -i 's/https\:\/\/github.com\/vincenthsu\/dotfiles-private-config-example.git/git@github.com\:vincenthsu\/dotfiles-private-config-example.git/g' $HOME/.dotfiles/private/.git/config
source bootstrap.sh

cd $HOME/.dotfiles
source optional.sh
