// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//
contract MinimalToken {
    mapping (address => uint) public balances;
    uint public totalSupply;
}