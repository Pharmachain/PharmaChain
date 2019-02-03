pragma solidity ^0.4.24;

import "./PrescriptionData.sol";
import "./PrescriptionAccessControl.sol";

contract Patient is PrescriptionData, PrescriptionAccessControl{

    /*
    Gets the prescription for a patient user.
    Args:
        prescriptionIndex(uint): Index of the prescription in the drugChain.
    Returns:
        Information from a Prescription struct
    */
    function getPatientPrescription(uint prescriptionIndex) public view onlyPatient returns(
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
        uint64 cancelDate
    ){
        require(prescriptionIndex < drugChain.length, "Index greater than the length");

        Prescription memory patient = drugChain[prescriptionIndex];
        // check if patientAccount is msg.sender, in the future TBI

        patientID = patient.patientID;
        prescriberID = patient.prescriberID;
        dispenserID = patient.dispenserID;
        drugID = patient.drugID;
        drugQuantity = patient.drugQuantity;
        fulfillmentDates = patient.fulfillmentDates;
        dateWritten = patient.dateWritten;
        daysValid = patient.daysValid;
        refillsLeft = patient.refillsLeft;
        isCancelled = patient.isCancelled;
        cancelDate = patient.cancelDate; 
    }
    
}
