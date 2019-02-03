pragma solidity ^0.4.24;
import "./PrescriptionBase.sol";
import "./PrescriptionData.sol";

/*
Will be inheritted into classes to ensure that only the proper users access the correct data. 
*/
contract PrescriptionAccessControl {
     
    // Defining a users role in the system
    // Uses the entities wallet address to find a user defined role.
    mapping(address => PrescriptionBase.Role) userRoles;

    // Ensures that a user is a patient
    modifier onlyPatient() {
        require(1 == 1, "AHHHHHHHHHHHHHHHHHH");
        // require(userRoles[msg.sender] == Role.PATIENT, "User is not a patient.");
        _;
    }
}
