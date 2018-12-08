// Test the ability to add a prescription
    function testAddingPrescription() public {
        uint index = p.addPrescription(data.patientID, data.prescriberID, data.dispenserID, data.drugID,
        data.drugQuantity, data.fulfillmentDates, data.dateWritten, data.daysValid, data.refillsLeft,
        data.isCancelled, data.cancelDate);
        Assert.equal(0, index, "index return error");

        uint256 patientID;
        uint128 prescriberID;
        uint128 dispenserID;
        uint64 drugID;
        string memory drugQuantity;
        uint64[16] memory fulfillmentDates;
        uint64 dateWritten;

        //Max local args is 16, limit reached. So last 4 values are not compared
        (patientID, prescriberID, dispenserID, drugID, drugQuantity, fulfillmentDates, dateWritten, , , , ) = p.getPatientPrescription(index);

        Assert.equal(uint(patientID), uint(data.patientID), "PatientID error....");
        Assert.equal(uint(prescriberID), uint(data.prescriberID), "PrescriberID error....");
        Assert.equal(string(drugQuantity), string(data.drugQuantity), "Drug quantity error....");
    }
    
    // Tests the results of an improper access for a prescription. 
    function testImproperChainIndexCheck() public {
        bool result = DeployedAddresses.Patient().call(bytes4(bytes32(keccak256("getPatientPrescription(2)"))));
        Assert.isFalse(result, "Failed to get prescription 2.");
        result = DeployedAddresses.Patient().call(bytes4(bytes32(keccak256("getPatientPrescription(0)"))));
        Assert.isFalse(result, "Failed to get prescription 0.");
    }
