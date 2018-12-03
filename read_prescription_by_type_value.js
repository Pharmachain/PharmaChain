let fs = require("fs");
let Web3 = require("web3");
let net = require("net");

let args = process.argv

async function read(contractName){

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

    Patient.options.address = fs.readFileSync("./patient_contract_address.txt").toString('ascii');

    let type = args[2]
    let comparison_value = args[3]
    
    for(i = 0; i < await Patient.methods.getDrugChainLength().call({from: account}); i++){
        console.log('x');
        let values = await Patient.methods.getPrescription(i).call({from: account});
        console.log('y');
        if(values[type] == comparison_value){
            console.log(values);
        }
    }

}

read('Patient.sol');
