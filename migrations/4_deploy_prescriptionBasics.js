PrescriptionData = artifacts.require("PrescriptionData");
PrescriptionBase = artifacts.require("PrescriptionBase");
PrescriptionAccessControl = artifacts.require("PrescriptionAccessControl")

module.exports = function(deployer){
    deployer.deploy(PrescriptionBase, {gas: 5000000});
    deployer.deploy(PrescriptionData, {gas: 5000000});
    deployer.deploy(PrescriptionAccessControl, {gas: 500000});
}