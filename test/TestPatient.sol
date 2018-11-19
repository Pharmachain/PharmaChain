pragma experimental ABIEncoderV2;


import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PrescriptionData.sol";
import "../contracts/PrescriptionBase.sol";
import "../contracts/Patient.sol";

contract TestPatient is PrescriptionBase{
    
    Patient p = Patient(DeployedAddresses.Patient());

    uint64[16] fu; // cannot assign arrays as a constant. So, this var must be here.
    Prescription data = Prescription({
        patientID: 0,
        prescriberID: 1,
        dispenserID: 2,
        drugID : 34,
        drugQuantity: "300mg",
        fullfillmentDates: fu,
        dateWritten: 1542357074,
        daysValid: 200,
        refillsLeft: 8,
        isCancelled: false,
        cancelDate: 0
    });


    // Test the ability to add a prescription
    function testAdding() public {
        uint index = p.addPrescription(data);
        Assert.equal(0, index, "index return error");

        uint256 patientID;
        uint128 prescriberID;
        uint128 dispenserID;
        uint64 drugID;
        string memory drugQuantity;
        uint64[16] memory fullfillmentDates;
        uint64 dateWritten;
        (patientID, prescriberID, dispenserID, drugID, drugQuantity, fullfillmentDates, dateWritten, , , , ) = p.getPatientPrescription(index);

        Assert.equal(uint(patientID), uint(data.patientID), "PatientID error....");
        Assert.equal(uint(prescriberID), uint(data.prescriberID), "PrescriberID error....");
        Assert.equal(string(drugQuantity), string(data.drugQuantity), "Drug quantity error....");
    }
}