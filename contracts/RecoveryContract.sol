// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract RecoveryContract is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    address public owner;
    bytes32 public latestRequestId;
    mapping(bytes32 => string) public responses;

    event RequestSent(bytes32 indexed requestId);
    event RequestFulfilled(bytes32 indexed requestId, string result);

    constructor() {
        owner = msg.sender;
        setPublicChainlinkToken();
    }

    function requestAddressCheck(string memory _addr) public returns (bytes32) {
        Chainlink.Request memory req = buildChainlinkRequest(
            "0xYourDevRelJobId",          // Job ID from Functions
            address(this),
            this.fulfill.selector
        );

        req.add("addrToCheck", _addr);

        bytes32 reqId = sendChainlinkRequest(req, 1 * LINK_DIVISIBILITY);
        latestRequestId = reqId;
        emit RequestSent(reqId);
        return reqId;
    }

    function fulfill(bytes32 _requestId, string memory _result) public recordChainlinkFulfillment(_requestId) {
        responses[_requestId] = _result;
        emit RequestFulfilled(_requestId, _result);
    }
}
