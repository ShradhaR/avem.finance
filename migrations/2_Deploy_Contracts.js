const Bank = artifacts.require("./Bank.sol");
const Likable = artifacts.require("./Likable.sol");
module.exports = function (deployer) {
  deployer.deploy(Bank);
  deployer.deploy(Likable);
};