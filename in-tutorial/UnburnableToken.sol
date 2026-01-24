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


error AllTokensClaimed(uint _totalSupply);
error TokensClaimed(uint __amountClaimed);

function claim (uint _amountClaimed) public {
    if (claimed[msg.sender] == 0) {
    if (totalSupply >= _amountClaimed){
        balances[msg.sender] += _amountClaimed;
        claimed[msg.sender] = true;
        totalClaimed += _amountClaimed;
        totalSupply -= _amountClaimed;
    } else {revert AllTokensClaimed(totalSupply);}
    } else {revert TokensClaimed(_amountClaimed);}
}


error UnsafeTransfer(uint _balance, uint _msgvalue);
error BalanceNotEnough(uint _balance);

function  (address _to, uint _amount) public {
    if (balances[msg.sender] > 0 && msg.value > 0) {
        if (balances[msg.sender] > _amount) {
             balances[_to] += _amount;
             balances[msg.sender] -= _amount;
        } else {revert BalanceNotEnough(balances[msg.sender]);}
} else {revert UnsafeTransfer();}
}

}