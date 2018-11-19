pragma experimental ABIEncoderV2;

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

    function getPrescription(uint chainIndex) public view returns (Prescription){
        Prescription memory p = drugChain[chainIndex];
        return p;
    }
    
    /*
    */
    function addPrescription(Prescription prescriptionOrder) public returns (uint) {
        drugChain.push(prescriptionOrder);
        return drugChain.length - 1;
    }
}