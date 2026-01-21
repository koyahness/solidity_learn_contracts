// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 
// OpenZeppelin
// OpenZeppelin has a robust library of well-documented smart contracts. These include a number of standard-compliant token implementations and a suite of utilities. All the contracts are audited and are therefore safer to use than random code you might find on the internet (you should still do your own audits before releasing to production).

import "./EnumerableSet.sol";

contract SetExploration {

// To use the EnumerableSet, you need to use the **using** keyword.
// This directive attaches all of the library methods to the type.
// Doing so allows you to call the method on the variable with the dot notation, and the variable itself will be supplied as the first argument.

using EnumerableSet for EnumerableSet.AddressSet;

EnumerableSet.AddressSet private visitors; //private variable of the AddressSet data types which is a struct in the EnumerableSet library that is imported

// Add a function called registerVisitor that makes use of the library’s add function to add the sender of the message to the visitors set.

function registerVisitor() public {
    visitors.add(msg.sender);  // add function is internal in the library
}


//Add another function to return the numberOfVisitors. Thanks to using, this can cleanly call the length function:
function numberOfVisitors() public view returns (uint) {
    return visitors.length();
}

}


//Imported a library from OpenZeppelin and implemented some of its functions.
//Used the using keyword.
