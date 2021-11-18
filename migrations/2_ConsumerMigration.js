const Contract = artifacts.require("SingleConsumerSample");

const _oracle = "0x83a9F5733511297A227B787297E9A3091b5BCf86";
const _linkTokenRinkeby = "0x01BE23585060835E02B77ef475b0Cc51aA1e0709";
const payment = 0;

module.exports = async function (deployer) {
    await deployer.deploy(Contract, _oracle, _linkTokenRinkeby, payment);
};