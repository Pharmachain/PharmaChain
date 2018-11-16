Structure: 
- PrescriptionBase holds all needed data structures, that are needed by all parties. 
- PrescriptionData is where the main 'drugChain', or where the pharmaceutical data is being stored. In order to access information about the drugChain from a different type of user, it must come from this smart contract. 
- PrescriptionCore will be our 'main' function later on 
- PrescriptionAccessControl will have all of the modifiers that determine who can access what. It is good to abstract this away from each type of user because these functions will likely be used more than once with different users. 
