// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Compiler Errors

// Bad code example, do not use
function compilerTypeError() public pure returns (uint) {
    uint myNumber = "One";
    return myNumber;
}