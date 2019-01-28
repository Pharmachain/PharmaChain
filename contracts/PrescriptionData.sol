pragma solidity ^0.5.0;

import "./PrescriptionBase.sol";


contract PrescriptionData is PrescriptionBase {

    
    Prescription[] public drugChain;

    /*
    Get a single prescription.
    Args:
        uint(chainIndex): The index of the drugChain;
    */
    /*
    function getPrescription(uint chainIndex) public view returns (
        uint256 patientID,
        uint128 prescriberID,
        uint128 dispenserID,
        uint64 drugID,
        string drugQuantity, 
        uint64[] fullfillmentDates,
        uint64 dateWritten,  
        uint16 daysValid,
        uint8[] refillsLeft,
        bool isCancelled, 
        uint64 cancelDate
    ){
        Prescription memory patient = drugChain[chainIndex];
        patientID = patient.patientID;
        prescriberID = patient.prescriberID;
        dispenserID = patient.dispenserID;
        drugID = patient.drugID;
        drugQuantity = patient.drugQuantity;
        fullfillmentDates = patient.fullfillmentDates;
        dateWritten = patient.dateWritten;
        daysValid = patient.daysValid;
        refillsLeft = patient.refillsLeft;
        isCancelled = patient.isCancelled;
        cancelDate = patient.cancelDate;
    }*/
//Fullfilment date and refill left removed
    function getPrescription(uint chainIndex) public view returns (uint256, uint128, uint128, uint64, string memory, uint64[16] memory, uint64, uint16, uint8, bool, uint64){
        Prescription memory p = drugChain[chainIndex];
        return (p.patientID, p.prescriberID, p.dispenserID, p.drugID, p.drugQuantity,
        p.fulfillmentDates, p.dateWritten, p.daysValid, p.refillsLeft, p.isCancelled, p.cancelDate);
    }

    function getDrugChainLength() public view returns (uint) {
        return drugChain.length;
    }
    
    /*
    */

        //uint64[] fullfillmentDates,
        //uint8[] refillsLeft,
    function addPrescription(
        uint256 patientID,
        uint128 prescriberID,
        uint128 dispenserID,
        uint64 drugID,
        string memory drugQuantity, 
        uint64[16] memory fulfillmentDates,
        uint64 dateWritten,  
        uint16 daysValid,
        uint8 refillsLeft,
        bool isCancelled, 
        uint64 cancelDate) public returns (uint) {
        //drugChain.push((patientID,prescriberID,dispenserID,drugID,drugQuantity,dateWritten,daysValid,isCancelled,cancelDate));
        /*fullfillmentDates,*/
        Prescription memory p = Prescription(patientID,prescriberID,dispenserID,drugID,drugQuantity,
        fulfillmentDates,dateWritten, daysValid, refillsLeft, isCancelled, cancelDate);

        drugChain.push(p);
        return drugChain.length -1;


    }

}
