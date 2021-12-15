// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import the newest version of the Chainlink Client that enables us 
// to interact with Oracle Contracts in a seemingless way
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

// import the Ownable contract from openzeppelin that allows us to restrict access to certain functions
import "@openzeppelin/contracts/access/Ownable.sol";


/// @title only consumes a single price at a time
/// @notice this is just an example of how to consume the oracle data with no full use case built in
/// @notice please get creative and think of stuff to build on top ;)
contract SingleConsumerSample is ChainlinkClient, Ownable {
    using Chainlink for Chainlink.Request;

    // jobId to call on the oracle (this is the rinkeby testnet jobId)
    bytes32 public jobId = "bb45e634c4704d02a90706625ac49d2d";
    // amount of Link the oracle receives as payment (18 decimals)
    uint256 public payment;

    /// @notice stores latest price and time of that valuation
    /// @dev use a uint224 and uint32 to only use one storage slot (256)
    struct NFTInfo {
        uint224 time;
        uint32 price;
    }

    /// @dev maps the ID of the NFT to the Info struct above
    mapping(uint256 => NFTInfo) public NFTinfo;

    /// @dev maps the request ID that is produced when calling the oracle to the NFT ID that got requested
    mapping(bytes32 => uint256) public idByRequest;

    /// @dev gets called only once when deploying
    /// @dev sets the oracle parameters via the methods inherited by ChainlinkClient.sol
    /// @notice payment can be 0 here for testing on rinkeby
    constructor(address _oracle, address _linkToken, uint256 _payment) {
        payment = _payment;
        setChainlinkToken(_linkToken);
        setChainlinkOracle(_oracle);
    }

    /**
    * @param id specifies the NFT ID that gets requested from the oracle
    * @notice requests a single valuation for a Sandbox Land ID from the Oracle
    * @notice it doesnt directly return the valuation
    * @dev there will be another job for requesting a lot of IDs at once for massive gas savings
    */
    function requestNFTvalue(uint256 id) public {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfillRequest.selector);
        req.addUint("tokenId", id);
        bytes32 _requestId = sendChainlinkRequest(req, payment);
        idByRequest[_requestId] = id;
    }

    /**
    * @param _requestID lets this contract know which request is being fulfilled
    * @param _price returns the price in USD, if _price == 4000 => the land is valuated at 4000 USD
    * @notice if 0 is returned as a price the oracle does not have enough historic data to make a sensible prediction. 
    *         Treat that case as a non response
    * @dev this function is called by the oracle shortly after the request was made
    */
    function fulfillRequest(bytes32 _requestID, uint256  _price) external recordChainlinkFulfillment(_requestID) {
        NFTinfo[idByRequest[_requestID]].price = uint32(_price);
        NFTinfo[idByRequest[_requestID]].time = uint224(block.timestamp);
    }

    /**
    * @notice changes the variables that state which oracle and which job to call as well how much to pay
    * @param _operator the oracle that is called in "requestNFTvalue"
    * @param _jobId the specific job that should be run
    * @param _payment the amount of link to pay for the job (18 decimals)
    */
    function configureOracle(address _operator, bytes32 _jobId, uint256 _payment) external onlyOwner {
        setChainlinkOracle(_operator);
        jobId = _jobId;
        payment = _payment;
    }
}   
