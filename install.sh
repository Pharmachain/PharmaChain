set -e
cd ~/build
#Pharmachain GitHub Pulls
git clone https://github.com/Pharmachain/quorum-maker
#git clone https://github.com/Pharmachain/PharmaChain
git clone https://github.com/Pharmachain/WebPhapp
#Docker, required for quorum maker
#apt-get -y install docker-compose
#apt-get -y install docker.io

#Ethereum Base Layer
apt-add-repository -y ppa:ethereum/ethereum
apt-get -y update
apt-get -y install ethereum

#Node version manager
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
cd ~/build/Pharmachain/PharmaChain
apt-get -y install npm
npm install truffle@4.1.14 --allow-root
alias truffle=~/build/Pharmachain/PharmaChain/nodemodules/.bin/truffle
sudo alias truffle=~/build/Pharmachain/PharmaChain/nodemules/.bin/truffle
npm install web3@1.0.0-beta.37 --allow-root --unsafe-perm=true
npm install @babel/runtime@latest

cd ~/build
echo "In top level directory"
pwd
echo "Repos:"
ls

cd ~/build/Pharmachain/PharmaChain
echo "In Pharmachain, directories: "
ls

echo "Viewing global npm repository"
npm list -g --depth=0
echo "Viewing local npm repository"
npm list --depth=0

sudo truffle version

#WebPhapp NPM Initialization
#cd ~/build/WebPhapp/WebPhapp/backend
#npm install
#cd ~/build/WebPhapp/WebPhapp/client
#npm install


#Quorum Maker Setup
#cd ~/build/quorum-maker
#./setup.sh &
#cd ~/build/Pharmachain


