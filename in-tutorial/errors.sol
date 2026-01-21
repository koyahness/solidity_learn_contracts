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


//

// You cannot use operators between types as flexibly as you may be used to.

// Bad code example, do not use
// function compilerOperatorError() public pure returns (uint) {
//     int8 first = 1;
//     uint256 second = 2;

//     uint sum = first + second;

//     return sum;
// }

// Operator errors are often paired with a type error.

// from solidity:
// TypeError: Operator + not compatible with types int8 and uint256.
//   --> contracts/ErrorTriage.sol:22:20:
//    |
// 22 |         uint sum = first + second;
//    |                    ^^^^^^^^^^^^^^

// from solidity:
// TypeError: Type int8 is not implicitly convertible to expected type uint256.
//   --> contracts/ErrorTriage.sol:22:9:
//    |
// 22 |         uint sum = first + second;
//    |         ^^^^^^^^^^^^^^^^^^^^^^^^^


function compilerOperatorErrorFixed() public pure returns (uint) {
    int8 first = 1;
    uint256 second = 2;

    uint sum = uint(uint8(first)) + second;

    return sum;
}


// Stack Depth Limit
// The EVM stack has 1024 slots, but only the top 16 slots are accessible.
// As a result, you can only have fewer than 16 variables in scope at one time. *********

//Other items can also use up these slots. You are not guaranteed 15 slots, it can be lower.

// Bad code example, do not use
// function stackDepthLimit() public pure returns (uint) {
//         uint first = 1;
//         uint second = 2;
//         uint third = 3;
//         uint fourth = 4;
//         uint fifth = 5;
//         uint sixth = 6;
//         uint seventh = 7;
//         uint eighth = 8;
//         uint ninth = 9;
//         uint tenth = 10;
//         uint eleventh = 11;
//         uint twelfth = 12;
//         uint thirteenth = 13;
//         uint fourteenth = 14;
//         uint fifteenth = 15;
//         uint sixteenth = 16;

//         return first +
//                 second +
//                 third +
//                 fourth +
//                 fifth +
//                 sixth +
//                 seventh +
//                 eighth +
//                 ninth +
//                 tenth +
//                 eleventh +
//                 twelfth +
//                 thirteenth +
//                 fourteenth +
//                 fifteenth +
//                 sixteenth;
//     }


// from solidity:
// CompilerError: Stack too deep. Try compiling with --via-ir (cli) or the equivalent viaIR: true (standard JSON) while enabling the optimizer. Otherwise, try removing local variables.
//   --> contracts/ErrorTriage.sol:92:17:
//    |
// 92 |                 eighth +
//    |                 ^^^^^^


}