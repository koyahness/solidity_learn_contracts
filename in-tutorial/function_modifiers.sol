// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Modifiers {
    address owner;

    constructor () {
        owner = msg.sender;
    }

    error NotOwner(address _msgSender);

    modifier onlyOwner {
    if (msg.sender != owner) {
        revert NotOwner(msg.sender);
    }
    _;
}


function iOwnThis() public view onlyOwner returns (string memory) {
    return "You own this!";
}


error NotEven(uint number);

modifier onlyEven(uint _number) {
    if(_number % 2 != 0) {
        revert NotEven(_number);
    }
    _;
}

function halver(uint _number) public pure onlyEven(_number) returns (uint) {
    return _number / 2;
}




}