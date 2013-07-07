#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install Heroku
source $(dirname $0)/setupheroku/install-ubuntu.sh
# please execute
# heroku login
# ssh-keygen -t rsa
# heroku keys:add
# git clone https://github.com/heroku/node-js-sample.git

#Install node.js and minimal necessary dev env 
sudo apt-get install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint
# Install useful node packages like restler, csv, accouting
npm install restler csv accounting

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd $HOME
# create unique id based on sha1sum and current date. cut strips '-' from sha1sum output
IDUNIQOLD=`date | sha1sum | cut -f 1 -d ' '`

mkdir -p ~/.old
if [ -d ./dotfiles/ ]; then
    mv dotfiles ~/.old/dotfiles.$IDUNIQOLD
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d ~/.old/.emacs.d.$IDUNIQOLD
fi

git clone https://github.com/enricmcalvo/dotfiles-supeng.git dotfiles
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

