let fs = require("fs");
let Web3 = require("web3");
let net = require("net");

/*  This script takes an index and returns a prescription from the drugChain.
    User input: prescription index on the drugChain.
    Argument list: index
    Example usage: node read_prescrip_index.js 0 
*/

async function read(index_value){

    // Connecting to the node 1. Will want to change to IPC connection eventually. 
	let web3 = new Web3( new Web3.providers.HttpProvider("http://10.50.0.2:22000", net));

    // Get account information
    let account = await web3.eth.personal.getAccounts();
    account = account[0];

    // Sets up contract requirements.
    let source = fs.readFileSync('./build/contracts/Patient.json'); 
    let contracts = JSON.parse(source);
    let code = contracts.bytecode;
    let abi = contracts.abi
    let Patient = new web3.eth.Contract(abi, null,{
        data: code,
    });

    Patient.options.address = fs.readFileSync("./patient_contract_address.txt").toString('ascii');

    let values = await Patient.methods.getPrescription(index_value).call({from: account});
    console.log(values);
    return values;

}

// Main: 

let args = process.argv;
let index = args[2];
read(index);
