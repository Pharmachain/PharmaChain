let fs = require("fs");
let Web3 = require("web3");
let net = require("net");

/*  This function creates a new prescription on the drugChain
    User input: prescription arguments
    Argument list: patientID, prescriberID, dispenserID, drugID, drugQuantity, dateWritten, daysValid, refillsLeft, isCancelled, cancelDate
    Example usage: node write_prescription.js 0 1 2 34 '300MG' 1542357074 200 8 false 0   
*/

async function write(patientID, prescriberID, dispenserID, drugID, drugQuantity, fulfillmentDates, dateWritten, daysValid, refillsLeft, isCancelled, cancelDate){

    // Connecting to the node 1. Will want to change to IPC connection eventually. 
	let web3 = new Web3( new Web3.providers.HttpProvider("http://10.50.0.2:22000", net));
    
    // Get account information
    let account = await web3.eth.personal.getAccounts();
    account = account[0];

    // Sets up deployment requirements
    let source = fs.readFileSync('./build/contracts/Patient.json'); 
    let contracts = JSON.parse(source);
    let code = contracts.bytecode;
    let abi = contracts.abi;
    let Patient = new web3.eth.Contract(abi, null,{
        data: code,
    });

    // Set up prescription data to be sent.
    Patient.options.address = fs.readFileSync("./patient_contract_address.txt").toString('ascii');
    let transaction = await Patient.methods.addPrescription(patientID, prescriberID, dispenserID, drugID, drugQuantity,
                                                         fulfillmentDates, dateWritten, daysValid, refillsLeft, isCancelled, cancelDate);
    
    // Submitting prescription transaction.
    let encoded_transaction = transaction.encodeABI();
    let block = await web3.eth.sendTransaction({
        data: encoded_transaction,
        from: account,
        to: Patient.options.address,
        gas: 50000000
    });
    
    // Return Transaction object containing transaction hash and other data
    return block;

}

// Main: 

let args = process.argv
let patientID = args[2];
let prescriberID = args[3];
let dispenserID = args[4];
let drugID = args[5];
let drugQuantity = args[6]; 
// Must be a 16 element int array in order to work. 
let fulfillmentDates = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
let dateWritten = args[7];  
let daysValid = args[8];
let refillsLeft = args[9];
let isCancelled = args[10];
let cancelDate = args[11];

write(patientID, prescriberID, dispenserID, drugID, drugQuantity, fulfillmentDates, dateWritten, daysValid, refillsLeft, isCancelled, cancelDate);
