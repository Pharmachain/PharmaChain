#!/bin/bash
set -e
cd ~/build/quorum-maker/TestNetwork

# Turn on the Quorum Network  
docker-compose up -d
sleep 5m

# Open the nodes up to be used
./modular.sh
# Open the nodes 

cd ~/build/Pharmachain/PharmaChain
truffle version
truffle test 
