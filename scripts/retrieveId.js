// first load the contract artifact that contains a lot of information about the contract
// here we are interested in the abi so we can interact with it
const Contract = artifacts.require("SingleConsumerSample");

// specify where the "SingleConsumerSample" contract is deployed, and which SandBox Land id we want to request
const deployedAddress = "0x277870154A1e536b5f9e723A0AdDEe98EaABd52B";
const id = 45;

module.exports = async function (callback) {
    // load the contract abi at the address, now we can interact with it easily
    const instance = await Contract.at(deployedAddress);

    // retrieve the struct by calling the public mapping on the contract
    const info = await instance.NFTinfo.call(id);

    console.log("id requested: ", id);
    console.log("oracle price in USD: ", info.price.toString());
    console.log("unix time of valuation: ", info.time.toString());
    return process.kill(process.pid);
}