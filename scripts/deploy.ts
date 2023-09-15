import { ethers } from "hardhat";

async function main() {

  const stablecoin = await ethers.deployContract("Stablecoin");

  await stablecoin.waitForDeployment();

  console.log("Stablecoin deployed to : ",await stablecoin.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
