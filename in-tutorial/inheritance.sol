// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Solidity is an object-oriented language. Contracts can inherit from one another, allowing efficient reuse of code.
// impact inheritance has on the byte code size limit

//Contract A says that it is “contract A” and ContractB says that it is “contract B”.in-tutorial/inheritance.sol

contract ContractB {
    function whoAmI() external pure returns (string memory) {
        return "contract B";
    }

    function whoAmIInternal() internal pure returns (string memory) {
        return "contract B";
    }

    function whoAmIExternal() external pure returns (string memory) {
        return whoAmIInternal();
    }

    // Bad code example, do not use
    function whoAmIPrivate() private pure returns (string memory) {
        return "contract B";
    }
}

// Inheritance between contracts is indicated by the is
contract ContractA is ContractB {
    // Even though ContractA doesn’t have any functions in it, the deployment still shows the button to call whoAmI
    // ContractA now reports that it is “contract B”, due to the inheritance of the function from Contract B.
    // Contracts can call the internal functions from contracts they inherit from
    function whoAmIExternal_A() external pure returns (string memory) {
        return whoAmIInternal();
    }

     // Bad code example, do not use..........The compiler will raise an error:
    function whoAmExternal_P() external pure returns (string memory) {
        return whoAmIPrivate();
    }

    //A contract that inherits from another contract will have that contract’s bytecode included within its own
    // A slightly more complex contract:
    // Will have more complex bytecode. In this case, mostly to store the long string present in the return:

}

contract ContractC {
    function whoAmI() external pure returns (string memory) {
        return "contract C";
    }
}

// bad code example, do not use
contract ContractA_B is ContractB, ContractC {
    function whoAmExternal() external pure returns (string memory) {
        return whoAmIInternal();
    }
}