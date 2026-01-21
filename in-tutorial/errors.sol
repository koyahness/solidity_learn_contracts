// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Compiler Errors

// Bad code example, do not use
// You will get a compiler error if you try to assign a literal to the wrong type.

// function compilerTypeError() public pure returns (uint) {
//     uint myNumber = "One";
//     return myNumber;
// }

//compilerTypeError
// from solidity:
// TypeError: Type literal_string "One" is not implicitly convertible to expected type uint256.
//  --> contracts/ErrorTriage.sol:8:9:
//   |
// 8 |         uint myNumber = "One";
//   |         ^^^^^^^^^^^^^^^^^^^^^

// Fix by correcting the type or value, as appropriate for your needs:
//  Fix by correcting the type or value, as appropriate for your needs:

contract errors {
    
function compilerTypeErrorFixed() public pure returns (string) {
    string myNumber = "One";
    return myNumber;
}

}