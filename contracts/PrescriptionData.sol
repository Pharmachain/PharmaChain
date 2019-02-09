pragma solidity ^0.4.24;

import "./PrescriptionBase.sol";


contract PrescriptionData is PrescriptionBase {

    
    Prescription[] public drugChain;

    function getPrescription(uint chainIndex) public view returns (uint256, uint128, uint128, uint64, string, uint64[16], uint64, uint16, uint8, bool, uint64){
        Prescription memory p = drugChain[chainIndex];
        return (p.patientID, p.prescriberID, p.dispenserID, p.drugID, p.drugQuantity,
        p.fulfillmentDates, p.dateWritten, p.daysValid, p.refillsLeft, p.isCancelled, p.cancelDate);
    }

    function getDrugChainLength() public view returns (uint) {
        return drugChain.length;
    }
    
    function updatePrescription(uint chainIndex, uint128 dispenserID,string drugQuantity, uint64[16] fulfillmentDates, 
            uint16 daysValid, bool isCancelled, uint64 cancelDate) public returns(uint) {
        Prescription updated_p = drugChain[chainIndex];
        updated_p.dispenserID = dispenserID;
        updated_p.drugQuantity = drugQuantity;
        updated_p.fulfillmentDates = fulfillmentDates;
        updated_p.daysValid = daysValid;
        updated_p.isCancelled = isCancelled;
        updated_p.cancelDate = cancelDate;

        return 0;

    }
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
        Prescription memory p = Prescription(patientID,prescriberID,dispenserID,drugID,drugQuantity,
        fulfillmentDates,dateWritten, daysValid, refillsLeft, isCancelled, cancelDate);

        drugChain.push(p);
        return drugChain.length -1;
    }
}
