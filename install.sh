#!/bin/bash
cd ~
apt-get -y install git

#Pharmachain GitHub Pulls
git clone https://github.com/Pharmachain/quorum-maker
git clone https://github.com/Pharmachain/PharmaChain
git clone https://github.com/Pharmachain/WebPhapp
cd ~
#Docker, required for quorum maker
apt-get -y install docker-compose
apt-get -y install docker.io

#Ethereum Base Layer
apt-add-repository -y ppa:ethereum/ethereum
apt-get -y update
apt-get -y install ethereum

#Node version manager
cd ~/PharmaChain
apt-get -y install curl
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 10.0
nvm use 10.0

#npm install. This part is currently buggy, and produces warnings.
#TODO: fix npm/node install issues
#apt-get -y install npm
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#apt-get install -y nodejs
sudo npm install truffle -g --allow-root
sudo npm install web3@1.0.0-beta.37 --allow-root --unsafe-perm=true
sudo npm install @babel/runtime@latest


#WebPhapp NPM Initialization
cd ./WebPhapp/backend
npm install
cd ./WebPhapp/client
npm install
cd ~/quorum-maker

#Quorum Maker Setup
./setup.sh &



