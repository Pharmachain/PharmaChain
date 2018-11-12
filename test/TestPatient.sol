pragma solidity ^0.4.17;


import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Patient.sol";

contract TestPatient {

    Patient max = Patient(DeployedAddresses.Patient());
    
    uint patient_id = 0;
    string drug_name = "Oxy!";

    // Test the ability to add a prescription
    function testAdding() public {

        uint spot = max.addPrescription(patient_id, drug_name);
        
        Assert.equal(spot, 3, "Expected this to be the 1st");

        string memory drug;
        uint time;
        (drug, time) = max.getPrescription(patient_id, 0);
        Assert.equal(drug_name, drug, "Error message...");
    }
}