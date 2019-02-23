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
        fulfillmentDates: fu,
        dateWritten: 1542357074,
        daysValid: 200,
        refillsLeft: 8,
        isCancelled: false,
        cancelDate: 0
    });


    // Test the ability to add a prescription
    function testAdding() public {
        uint index = pContract.addPrescription(data.patientID, data.prescriberID, data.dispenserID, data.drugID,
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
        (patientID, prescriberID, dispenserID, drugID, drugQuantity, fulfillmentDates, dateWritten, , , , ) = pContract.getPrescription(index);
        Assert.equal(patientID, data.patientID, "PatientID error....");
    }

    //test ability to update a prescription
    function testUpdate() public{
        uint index = pContract.updatePrescription(data.patientID, data.prescriberID, data.dispenserID, data.drugID,
        data.drugQuantity, data.fulfillmentDates, data.dateWritten, data.daysValid, data.refillsLeft,
        data.isCancelled, data.cancelDate);
        

        uint256 patientID;
        uint128 prescriberID;
        uint128 dispenserID;
        uint64 drugID;
        string memory drugQuantity;
        uint64[16] memory fulfillmentDates;
        uint64 dateWritten;

        uint16 daysValid;
        bool isCancelled;
        uint64 cancelDate;


         //Max local args is 16, limit reached. So last 4 values are not compared
        (patientID, prescriberID, dispenserID, drugID, drugQuantity, fulfillmentDates, dateWritten, , , , ) = pContract.getPrescription(index);
        Assert.equal(patientID, data.patientID, "PatientID error....");
    }

    function testCancel() public{
        uint index = pContract.updatePrescription(data.patientID, data.prescriberID, data.dispenserID, data.drugID,
        data.drugQuantity, data.fulfillmentDates, data.dateWritten, data.daysValid, data.refillsLeft,
        data.isCancelled, data.cancelDate);
        

        uint256 patientID;
        uint128 prescriberID;
        uint128 dispenserID;
        uint64 drugID;
        string memory drugQuantity;
        uint64[16] memory fulfillmentDates;
        uint64 dateWritten;

        uint16 daysValid;
        bool isCancelled;
        uint64 cancelDate;


         //Max local args is 16, limit reached. So last 4 values are not compared
        (patientID, prescriberID, dispenserID, drugID, drugQuantity, fulfillmentDates, dateWritten, , , , ) = pContract.getPrescription(index);
        Assert.equal(patientID, data.patientID, "PatientID error....");
    }

    
    //function testRedeem() public{}
}