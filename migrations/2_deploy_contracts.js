const BRLXToken = artifacts.require("./BRLXToken.sol");

module.exports = function(deployer) {
  deployer.deploy(BRLXToken, 100000000000000, 'Ethiopian Birr Stablecoin', 6, 'ETBS');
};
