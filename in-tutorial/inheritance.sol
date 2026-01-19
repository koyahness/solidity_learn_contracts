// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Solidity is an object-oriented language. Contracts can inherit from one another, allowing efficient reuse of code.
// impact inheritance has on the byte code size limit

//Contract A says that it is “contract A” and ContractB says that it is “contract B”.in-tutorial/inheritance.sol

contract ContractB {
    function whoAmI() external pure returns (string memory) {
        return "contract B";
    }
}

// Inheritance between contracts is indicated by the is
contract ContractA is ContractB {

    // Even though ContractA doesn’t have any functions in it, the deployment still shows the button to call whoAmI
    
}