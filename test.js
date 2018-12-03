let fs = require("fs");
let Web3 = require("web3");
let net = require("net");

async function deploy(contractName){

    // This is actually connecting to the node!
	let web3 = new Web3( new Web3.providers.HttpProvider("http://10.50.0.2:22000", net));

    
    // get account information
    let account = await web3.eth.personal.getAccounts();
    console.log(account);
    account = account[0];

    // sets up deployment needs
    let source = fs.readFileSync('/home/osboxes/PharmaChain/build/contracts/Patient.json'); 
    let contracts = JSON.parse(source);
    let code = contracts.bytecode;
    let abi = contracts.abi
    let Patient = new web3.eth.Contract(abi, null,{
        data: code,
    });

    let contractInstance = await Patient.deploy().send({
        from: account,
        gasPrice: 0,
        gas: 1000000000,
    });

   

    

    console.log(contractInstance.methods);
    let ac = await contractInstance.methods.ac(1).call({from: account});
    console.log(ac);
    let transx = await contractInstance.methods.addPrescription(0,1,2,34,"300MG",1542357074,200,false,0);
    let encoded_transx = transx.encodeABI();
    web3.eth.sendTransaction({
        data: encoded_transx,
        from: account,
        to: contractInstance.options.address,
        gas: 50000000
    }, function(error,hash){
        console.log("Successs");
        console.log(error);
        console.log(hash);
    });

    setTimeout(async function(){
        let values = await contractInstance.methods.getPrescription(0).call({from: account});
        console.log(values);
    }, 10000);

}

deploy('Patient.sol');
