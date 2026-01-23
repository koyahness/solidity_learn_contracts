// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The minimal elements needed for a token are pretty basic.
// Start by creating a contract called MinimalToken.
// Add a mapping to relate user addresses to the number of tokens they possess.
// Finally, add a variable to track totalSupply

contract MinimalToken {
    mapping (address => uint) public balances;
    uint public totalSupply;

    // Update the constructor and hardcode a distribution of the tokens to be evenly split between the first three test accounts:
    constructor() {
    totalSupply = 3000;

    balances[msg.sender] = totalSupply / 3;
    balances[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = totalSupply / 3;
    balances[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = totalSupply / 3;
}

// Redeploy and test again. Now, each of the first three accounts should have 1000 tokens.

// missing a way to allow the owners of these tokens to share them or spend them


// Add a function called transfer that accepts an address of _to and a uint for the _amount. You don’t need to add anything for _from, because that should only be msg.sender. The function should subtract the _amount from the msg.sender and add it to _to

error InsufficientTokens(int _balance);

function transfer(address _to, uint _amount) public {
    int newSenderBalance = int(balances[msg.sender] - _amount);
    if (newSenderBalance < 0) {
        revert InsufficientTokens(newSenderBalance);
    }

    balances[msg.sender] = uint(newSenderBalance);
    balances[_to] += _amount;
}

// Destroying Tokens: sedn to zero address

// A more guaranteed way to destroy, or burn a token, is to transfer it to the default address 0x0000000000000000000000000000000000000000. This address is unowned and unownable, making it mathematically impossible to retrieve any tokens that are sent to it. Redeploy and try it out by sending 1000 tokens to the zero address.

// The totalSupply remains unchanged, and the balance of the zero address is visible, but those tokens are stuck there forever.

}