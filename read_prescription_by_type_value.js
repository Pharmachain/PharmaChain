let fs = require("fs");
let Web3 = require("web3");
let net = require("net");

let args = process.argv

/*  This script takes a type and a value, and returns prescriptions
    that have a type, of the first index and, a value of the second index.
    

    Index meaning: 0:patientID, 1:prescriberID, 2:dispenserID, 3:drugID, 4:drugQuantity, 5:dateWritten, 6:daysValid, 7:refillsLeft, 8:isCancelled, 9:cancelDate


    Example usage: node read_prescription_type_value.js 0 0
    
    This example will search the blockchain for prescriptions with 
    patientID = 0. It will return all found prescriptions that match this criteria.

*/
async function read(type_i, value_i){

    // This is actually connecting to the node!
	let web3 = new Web3( new Web3.providers.HttpProvider("http://10.50.0.2:22000", net));

    
    // get account information
    let account = await web3.eth.personal.getAccounts();
    account = account[0];

    // sets up deployment needs
    let source = fs.readFileSync('./build/contracts/Patient.json'); 
    let contracts = JSON.parse(source);
    let code = contracts.bytecode;
    let abi = contracts.abi
    let Patient = new web3.eth.Contract(abi, null,{
        data: code,
    });

    Patient.options.address = fs.readFileSync("./patient_contract_address.txt").toString('ascii');

    let type = type_i
    let comparison_value = value_i
    
    for(i = 0; i < await Patient.methods.getDrugChainLength().call({from: account}); i++){
        let values = await Patient.methods.getPrescription(i).call({from: account});
        if(values[type] == comparison_value){
            console.log(values);
        }
    }

}
let type = args[2]
let value = args[3]
read(type, value);
