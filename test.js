let fs = require("fs");
let Web3 = require("web3");
let net = require("net");

async function deploy(contractName){

    // This is actually connecting to the node!
	let web3 = new Web3( new Web3.providers.HttpProvider("http://10.50.0.2:22000", net));

    
    // get account information
    let account = await web3.eth.personal.getAccounts();
    account = account[0];

    // sets up deployment needs
    let source = fs.readFileSync('/home/osboxes/truffle/build/contracts/Patient.json'); 
    let contracts = JSON.parse(source);
    let code = contracts.bytecode;
    let abi = contracts.abi
    let Patient = new web3.eth.Contract(abi, null,{
        data: code,
    });

    // let new_account = await web3.eth.accounts.create();
    // console.log(new_account);

    // Deploys the smart contract
    let contractInstance = await Patient.deploy().send({
        from: account,
        gasPrice: 0,
        gas: 1000000000,
    });

    // calls a function
    let x = await contractInstance.methods.ac(1).call({from: account});
    console.log(x);
	
}

deploy('Patient.sol');
