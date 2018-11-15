pragma solidity ^0.4.22;

import "./Prescription.sol";

contract Patient {
    Info[] drug_chain;
    uint[] users;
    

    struct Info {
        string drug_name;
        uint time_added;
    }

	// manually check for the ID to be in the array or not.
    function addPrescription(uint patient_id, string drug) public returns (uint) {
		// smart contract modifer for having permission to do this needs to be added.
        Info memory prescription = Info({drug_name: drug, time_added: now}); 
        drug_chain.push(prescription);
        users.push(patient_id);

        return users.length - 1;
    }

    // get the prescription
    function getPrescription(uint patient_id, uint index) public view returns (
        // smart contract modifer for having permission to do this needs to be added.
        string drug_name,
        uint time_added
    ) {
        drug_name = drug_chain[index].drug_name;
        time_added = drug_chain[index].time_added;
    }
	
}
