pragma experimental ABIEncoderV2;


import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PrescriptionData.sol";
import "../contracts/PrescriptionBase.sol";

contract TestPrescription is PrescriptionBase{

    PrescriptionData pContract = PrescriptionData(DeployedAddresses.PrescriptionData());
    
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
        uint index = pContract.addPrescription(data);
        Assert.equal(0, index, "index return error");

        Prescription memory pharm = pContract.getPrescription(index);
        Assert.equal(pharm.patientID, data.patientID, "PatientID error....");
    }
}