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

function compilerTypeErrorFixed() public pure returns (string memory) {
    string memory myNumber = "One";
    return myNumber;
}


// Conversion Errors

// Conversion errors occur when you attempt to implicitly convert one type to another.
// Solidity only allows this under very narrow circumstances where there is no possibility of ambiguous interpretation of the data.

// Bad code example, do not use
// function compilerConversionError() public pure returns (uint) {
//     int8 first = 1;

//     return first;
// }


//value is daclared as int8 but requesting to rerun as int

// from solidity:
// TypeError: Return argument type int8 is not implicitly convertible to expected type (type of first return variable) uint256.
//   --> contracts/ErrorTriage.sol:15:16:
//    |
// 15 |         return first;
//    |                ^^^^^

function compilerConversionErrorFixed() public pure returns (uint) {
    int8 first = 1;

    return uint(uint8(first));
}


}