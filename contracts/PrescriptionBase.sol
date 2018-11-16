pragma experimental ABIEncoderV2;

import "./PrescriptionAccessControl.sol";

contract PrescriptionBase is PrescriptionAccessControl{

    /*
    Holds all of the data for all prescription orders, current and cancelled. 
    *

    /*
    The defined 'roles' of the ecosystem.
    */
    enum UserRoles {
        // Average user of the system
        Patient,
        // Doctors
        Prescriber,
        // Pharmacies
        Dispenser,
        // Government oversight
        Overseer,
        // Only role to add users to the system
        Controller
    }

    struct Prescription {

        // The id associated with a user
        uint256 patientID;
        // The id associated with a prescriber
        uint128 prescriberID; 
        // The id associated with a prescriber
        uint128 dispenserID;
        // The id associated with an individual drug
        uint64 drugID;
        // A value to explain the amount of the drug to give. 
        // This is a string so that the measurement can be accessed
        string drugQuantity; 
        // The dates in which the drug was fulfilled
        // Will have to encode this on the frontend (likely just unix time) for all dates
        // Arrays must be static in order to pass them around. So, this is constrained to 16 value, at the moment.
        uint64[16] fullfillmentDates;
        // The date the prescription was prescribed
        uint64 dateWritten; 
        // The amount of days that the prescription is valid for pickup. 
        uint16 daysValid;
        // The amount of fills that the drug is allowed.
        uint8 refillsLeft;
        // Has the prescription request been cancelled?
        bool isCancelled; 
        // The date of the cancellation of the prescription request
        uint64 cancelDate;
    }
    
}

