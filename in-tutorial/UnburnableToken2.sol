// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract UnburnableToken {

//variables for token supply, claimed tokens and wallet status: balance and claimed status
uint public totalSupply;
uint public totalClaimed;
mapping (address => uint) public balances;
mapping (address => bool) public claimed;

// sets total supply, 100_000_000; // No decimals, simple integer tokens
constructor {
    totalSupply = 100,000,000;
}

//custom errors
error AllTokensClaimed(uint _totalSupply);
error TokensClaimed(uint _amountClaimed);
error UnsafeTransfer(uint _balance, uint _msgvalue);
error BalanceNotEnough(uint _balance);


// claim 1000 tokens per address
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


function safeTransfer (address _to, uint _amount) public {
    if (balances[msg.sender] > 0 && _to.balance > 0 && _to != address(0)) {
        if (balances[msg.sender] > _amount) {
             balances[_to] += _amount;
             balances[msg.sender] -= _amount;
        } else {revert BalanceNotEnough(balances[msg.sender]);}
} else {revert UnsafeTransfer();}
}

}