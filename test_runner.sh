#!/bin/bash
set -e
cd ~/build/quorum-maker/TestNetowrk

# Turn on the Quorum Network  
sudo docker-compose up -d
sleep 5m

# Open the nodes up to be used
./modular.sh
# Open the nodes 

cd ~/build/PharmaChain
truffle test 
