const BRLXToken = artifacts.require("./BRLXToken.sol");

module.exports = function(deployer) {
  deployer.deploy(BRLXToken, 1000000, 'Brazilian Real Stablecoin', 6, 'BRL');
};
