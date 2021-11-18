# SampleCode
A bunch of sample contracts and scripts that can be used as inspiration to build on top of services we provide.

<h3>Repository Structure</h3>

This repo is structured like a truffle project. 
Here is a list of what each folder contains:

contracts/ : Actual Solidity code.<br>
build/ : .json artifacts for all the contracts that this repo needs.<br>
migrations/ : Deployment scripts for the contracts.<br>
scripts/ : scripts for programatically interacting with contracts that are already deployed somewhere.<br>

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
If you are just starting out we recommend interacting via the GUI remix.ethereum.org offers.<br>
To interact with the SingleConsumerSample contract in remix simply follow these steps:<br>
&nbsp;&nbsp;1. Copy the contract code from the contracts/ folder.<br>
&nbsp;&nbsp;2. Paste the contract in a new file in remix workspace.<br>
&nbsp;&nbsp;3. compile the file with the specified compiler version.<br>
&nbsp;&nbsp;4. Select injected web3 to interact with the chain specified in your metamask.<br>
&nbsp;&nbsp;5. deploy the contract anew or paste an address and load it there.<br>

<h3>Deployments</h3>

<h4>Rinkeby:</h4>
* SingleConsumerSample:         0x277870154A1e536b5f9e723A0AdDEe98EaABd52B<br>
* Operator (Chainlink Oracle):  0x83a9F5733511297A227B787297E9A3091b5BCf86<br>

    