const Tamagotchi = artifacts.require("Tamagotchi");

module.exports = function(deployer) {
  deployer.deploy(Tamagotchi, "test tamagotchi", 10000000000);
};
