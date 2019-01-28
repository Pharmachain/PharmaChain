#!/bin/bash
cd ~
apt-get -y install git
git init
git clone https://github.com/Pharmachain/quorum-maker
git clone https://github.com/Pharmachain/PharmaChain
git clone https://github.com/Pharmachain/WebPhapp
cd ~
apt-get -y install docker.io
apt-get -y install docker-compose
apt-add-repository -y ppa:ethereum/ethereum
apt-get -y update
apt-get -y install ethereum
cd ~/PharmaChain
apt-get -y install curl
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 10.0
nvm use 10.0
apt-get -y install npm
#npm install node-gyp --unsafe -perm
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs
#npm uninstall -g truffle
sudo npm install truffle -g --allow-root
sudo npm install web3@1.0.0-beta.37 --allow-root --unsafe-perm=true
sudo npm install @babel/runtime@latest
#npm i -g truffle
#npm i truffle
#npm install -g truffle
#npm install truffle
#npm install --save web3@1.0.0-beta.26
#npm install -g web3 --unsafe-perm=true --allow-root
#npm install scrypt --unsafe-perm=true --allow-root
# npm -g install@next
cd ~/WebPhapp/WebPhapp/backend
npm install
cd ~/WebPhapp/WebPhapp/client
npm install
cd ~/quorum-maker
./setup.sh &



