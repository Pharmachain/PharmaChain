PrescriptionData = artifacts.require("./PrescriptionData.sol");
PrescriptionBase = artifacts.require("./PrescriptionBase.sol");
PrescriptionAccessControl = artifacts.require("./PrescriptionAccessControl.sol")

module.exports = function(deployer){
    deployer.deploy(PrescriptionBase, {gas: 5000000});
    deployer.deploy(PrescriptionData, {gas: 5000000});
    deployer.deploy(PrescriptionAccessControl, {gas: 500000});
}
