
cd ..
sudo git clone https://github.com/Pharmachain/quorum-maker
echo "Clone into quroum-maker"
cd quorum-maker
echo "Move into quroum-maker"
cd TestNetwork

# Turn on the Quorum Network  
sudo docker-compose up -d

# Open the nodes up to be used
./modular.sh
# Open the nodes 

cd ../..
cd PharmaChain/
ls -la
truffle test 
exit $?
