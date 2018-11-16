PrescriptionData = artifacts.require("PrescriptionData");
PrescriptionBase = artifacts.require("PrescriptionBase");
module.exports = function(deployer){
    deployer.deploy(PrescriptionBase, {gas: 5000000});
    deployer.deploy(PrescriptionData, {gas: 5000000});
}