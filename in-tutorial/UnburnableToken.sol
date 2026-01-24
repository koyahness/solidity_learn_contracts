// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract UnburnableToken {

mapping (address => uint) public balances;
uint public totalSupply;
uint public totalClaimed;
mapping (address => bool) public claimed;

constructor {
    totalSupply = 100,000,000;
}


error AllTokensClaimed(uint _totalSupply)

function claim (uint _amountClaimed) public {
    if (claimed[msg.sender] == 0) {
    if (totalSupply >= _amountClaimed){
        balances[msg.sender] += _amountClaimed
        claimed[msg.sender] = true
        totalClaimed += _amountClaimed
        totalSupply -= _amountClaimed
    } else {revert AllTokensClaimed(totalSupply);}
    } else {revert TokensClaimed();}
}






}