import { ethers } from "hardhat";

async function main() {

  const lmao = await ethers.deployContract("LMAO");

  await lmao.waitForDeployment();

  const wlmao = await ethers.deployContract("WLMAO");

  await wlmao.waitForDeployment();


  console.log("Lmao deployed successfully at", lmao.target);
  console.log("WLmao deployed successfully at", wlmao.target);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
