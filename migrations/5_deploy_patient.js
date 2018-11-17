Patient = artifacts.require("Patient");

module.exports = function(deployer){
    deployer.deploy(Patient, {gas: 5000000});
}