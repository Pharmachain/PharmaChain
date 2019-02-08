#!/bin/bash
set -e
cd ~/build/quorum-maker/TestNetwork

# Turn on the Quorum Network  
docker-compose up -d
sleep 1m

# Open the nodes up to be used
./modular.sh
# Open the nodes 

cd ~/build/Pharmachain/PharmaChain
sudo truffle version
sudo truffle test 
