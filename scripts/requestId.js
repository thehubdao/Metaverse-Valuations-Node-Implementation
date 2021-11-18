// first load the contract artifact that contains a lot of information about the contract
// here we are interested in the abi so we can interact with it
const Contract = artifacts.require("SingleConsumerSample");

// specify where the "SingleConsumerSample" contract is deployed, and which SandBox Land id we want to request
const deployedAddress = "0x277870154A1e536b5f9e723A0AdDEe98EaABd52B";
const id = 45;

module.exports = async function (callback) {
    // load the contract abi at the address, now we can interact with it easily
    const instance = await Contract.at(deployedAddress);

    // log to make sure everything went well so far
    console.log("transaction starts now");

    // wait for the tx to be confirmed and save the data
    const tx = await instance.requestNFTvalue(id);

    //log some useful information about the transaction just for fun!
    const success = tx.receipt.status;
    console.log(await tx.receipt);
    if(success) console.log("successfully requested the id ", id);
    if(!success) console.log("transaction failed, see above for more information");

    return process.kill(process.pid);
}
