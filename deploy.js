let fs = require("fs");
let Web3 = require("web3");
let net = require("net");

/* Script to deploy a new version of the patient contract.
    Returns the memory address of the newly deployed contract.
    Update read, write scripts with new address.
 */

async function deploy(contractName){

    // This is actually connecting to the node!
	let web3 = new Web3( new Web3.providers.HttpProvider("http://10.50.0.2:22000", net));

    
    // get account information
    let account = await web3.eth.personal.getAccounts();
    account = account[0];

    // sets up deployment needs
    let source = fs.readFileSync('./build/contracts/Patient.json'); 
    let contracts = JSON.parse(source);
    let code = contracts.bytecode;
    let abi = contracts.abi;
    let Patient = new web3.eth.Contract(abi, null,{
        data: code
    });

    let contractInstance = await Patient.deploy().send({
        from: account,
        gasPrice: 0,
        gas: 1000000000
    });

    console.log(contractInstance.options.address);

    fs.writeFile("patient_contract_address.txt", contractInstance.options.address, () => {});
    process.env.CONTRACT_ADDRESS = contractInstance.options.address;
    return contractInstance.options.address;
}

deploy('Patient.sol');
