// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WalletRecovery {

    address public owner;
    address public recoveryAddress;

    event RecoveryRequested(address indexed user);
    event RecoveryExecuted(address indexed oldOwner, address indexed newOwner);

    constructor(address _recoveryAddress) {
        owner = msg.sender;
        recoveryAddress = _recoveryAddress;
    }

    function requestRecovery() public {
        emit RecoveryRequested(msg.sender);
    }

    function executeRecovery(address newOwner) public {
        require(msg.sender == recoveryAddress, "Not authorized");
        address oldOwner = owner;
        owner = newOwner;
        emit RecoveryExecuted(oldOwner, newOwner);
    }
}