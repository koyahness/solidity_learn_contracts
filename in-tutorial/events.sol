// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//declare, trigger, and utilize events
//enhance the functionality and user experience of your decentralized applications

// an abstraction on top of the EVM’s logging functionality. Applications can subscribe and listen to these events through the RPC interface of an Ethereum client.

//when you call them, they cause the arguments to be stored in the transaction’s log – a special data structure in the blockchain

//These logs are associated with the address of the contract that emitted them, are incorporated into the blockchain, and stay there as long as a block is accessible (forever as of now, but this might change in the future).

//events are an abstraction that allow you to store a transaction’s log information in the blockchain

// contract that’s included by default in Hardhat.
contract Lock {
    uint public unlockTime;
    address payable public owner;

    event Created(address owner, uint amount);

    constructor(uint _unlockTime) payable {
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );

        unlockTime = _unlockTime;
        owner = payable(msg.sender);

        emit Created(msg.sender, msg.value);
    }
}
