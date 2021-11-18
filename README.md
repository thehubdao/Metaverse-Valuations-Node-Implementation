# SampleCode
A bunch of sample contracts and scripts that can be used as inspiration to build on top of services we provide.

<h3>Repository Structure</h3>

This repo is structured like a truffle project. 
Here is a list of what each folder contains:

contracts/ : Actual Solidity code.
build/ : .json artifacts for all the contracts that this repo needs.
migrations/ : Deployment scripts for the contracts.
scripts/ : scripts for programatically interacting with contracts that are already deployed somewhere.

<h3>Dependencies</h3>
<p>
Other than truffle we the repo makes use of these packages:
@chainlink/contracts
@openzeppelin/contracts

To install them go to the root and type:

<code> npm install @chainlink/contracts </code>

<code> npm install @openzeppelin/contracts </code>
</p>

<h3>Guide for new developers</h3>
If you are just starting out we recommend interacting via the GUI remix.ethereum.org offers.
To interact with the SingleConsumerSample contract in remix simply follow these steps:
    1. Copy the contract code from the contracts/ folder.
    2. Paste the contract in a new file in remix workspace.
    3. compile the file with the specified compiler version.
    4. Select injected web3 to interact with the chain specified in your metamask.
    5. deploy the contract anew or paste an address and load it there.


    