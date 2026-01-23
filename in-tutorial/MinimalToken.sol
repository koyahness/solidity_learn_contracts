// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The minimal elements needed for a token are pretty basic.
// Start by creating a contract called MinimalToken.
// Add a mapping to relate user addresses to the number of tokens they possess.
// Finally, add a variable to track totalSupply

contract MinimalToken {
    mapping (address => uint) public balances;
    uint public totalSupply;

    // Add a constructor that initializes the totalSupply at 3000 and assigns ownership to the contract creator
    constructor() {
    totalSupply = 3000;

    balances[msg.sender] = totalSupply;

    // Deploy and test to confirm that the total supply is 3000, and the balance of the first account is as well.


}
}