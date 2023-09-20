import { ethers } from "hardhat";

const name = "My_Stablecoin";
const symbol = "mSTB";
const decimals = 8;
const initial_supply = 1000;
const supply_limit = 5000;

async function main() {

  const stablecoin = await ethers.deployContract("Stablecoin", [name, symbol, decimals, initial_supply, supply_limit]);

  await stablecoin.waitForDeployment();

  console.log("Stablecoin deployed to : ",await stablecoin.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
