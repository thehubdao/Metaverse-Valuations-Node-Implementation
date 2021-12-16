# SampleCode
A bunch of sample contracts and scripts that can be used as inspiration to build on top of services we provide.

<h3>Repository Structure</h3>
This repo is structured like a truffle project. 
Here is a list of what each folder contains:
<ul>
<li>contracts/ : Actual Solidity code.</li>
<li>build/ : .json artifacts for all the contracts that this repo needs.</li>
<li>migrations/ : Deployment scripts for the contracts.</li>
<li>scripts/ : scripts for programatically interacting with contracts.</li>
</ul>

<h3>Dependencies</h3>

Other than truffle we the repo makes use of these packages:<br>
<ul>
<li>@chainlink/contracts</li>
<li>@openzeppelin/contracts</li>
</ul>
To install them go to the root and type:

<code> npm install @chainlink/contracts </code>

<code> npm install @openzeppelin/contracts </code>

<h3>Guide for new developers</h3>
<ol>
<li>Copy the contract code from the contracts/ folder.</li>
<li>Paste the contract in a new file in remix workspace.</li>
<li>compile the file with the specified compiler version.</li>
<li>Select injected web3 to interact with the chain specified in your metamask.</li>
<li>deploy the contract anew or paste an address and load it there.</li>
</ol>

<h3>Deployments</h3>
<b>
   <h4>Sandbox Oracles:<h4>
</b>
<h4>Mainnet:</h4>
<ul>
<li>SingleConsumerSample:
<li>Operator (Oracle Contract):  0x0610868e4Ca6bE003D564519ADB81cbcFcfba22F</li>
<li>Job_Id:&emsp;&emsp;&emsp;&emsp;&emsp;"e770f4e4d7974b0c92857674527930fc"</li>
</ul>
<h4>Rinkeby:</h4>
<ul>
<li>SingleConsumerSample:        0x277870154A1e536b5f9e723A0AdDEe98EaABd52B</li>
<li>Operator (Oracle Contract):  0x83a9F5733511297A227B787297E9A3091b5BCf86</li>
</ul>

<h3>Additional ressources</h3>
We use chainlink architecture for our oracle. 
For more information on Chainlink check out their docs under: https://docs.chain.link/

    
