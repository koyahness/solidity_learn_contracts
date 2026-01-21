// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 
// OpenZeppelin
// OpenZeppelin has a robust library of well-documented smart contracts. These include a number of standard-compliant token implementations and a suite of utilities. All the contracts are audited and are therefore safer to use than random code you might find on the internet (you should still do your own audits before releasing to production).

import "./EnumerableSet.sol";

contract SetExploration {
//To use the EnumerableSet, you need to use the **using** keyword. This directive attaches all of the library methods to the type. 
using EnumerableSet for EnumerableSet.AddressSet;

EnumerableSet.AddressSet private visitors;

// Add a function called registerVisitor that makes use of the library’s add function to add the sender of the message to the visitors set.

//Add a function called registerVisitor that makes use of the library’s add function to add the sender of the message to the visitors set.

function registerVisitor() public {
    visitors.add(msg.sender);
}

function numberOfVisitors() public view returns (uint) {
    return visitors.length();
}

}
