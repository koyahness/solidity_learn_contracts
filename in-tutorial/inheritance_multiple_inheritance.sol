// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Solidity is an object-oriented language. Contracts can inherit from one another, allowing efficient reuse of code.
// impact inheritance has on the byte code size limit

//Contract A says that it is “contract A” and ContractB says that it is “contract B”.in-tutorial/inheritance.sol

contract ContractB {
    function whoAmI() public virtual view returns (string memory) {
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

    //  // Bad code example, do not use..........The compiler will raise an error:
    // function whoAmExternal_P() external pure returns (string memory) {
    //     return whoAmIPrivate();
    // }

    //A contract that inherits from another contract will have that contract’s bytecode included within its own
    // A slightly more complex contract:
    // Will have more complex bytecode. In this case, mostly to store the long string present in the return:

    }





contract ContractC {
    function whoAmI() public virtual view returns (string memory) {
        return "contract C";
    }
}





// bad code example, do not use
contract ContractA_B is ContractB, ContractC {

    //Add an enum at the contract level in ContractA to allow to switch contracts
    enum Type { None, ContractBType, ContractCType }
    
    Type contractType;
    
    constructor (Type _initialType) {
    contractType = _initialType;
}

function changeType(Type _newType) external {
    contractType = _newType;
}

// The compile error is because both ContractB and ContractC contain a function called whoAmI. As a result, the compiler needs instruction on which to use.
//One method to resolve this conflict is to use the virtual and override keywords to enable you to add functionality to choose which to call.
//Add the virtual keyword to the whoAmI function in both ContractC and ContractB.
// They must also be made public instead of external, because external functions cannot be called within the contract.

// Bad code example, do not use
// You’ll get another error, telling you to specify which contracts this function should override.
// function whoAmI() public override pure returns (string memory) {
//     return ContractB.whoAmI();
// }

// solution
// function whoAmI() external override(ContractB, ContractC) pure returns (string memory) {
//     return ContractB.whoAmI();
// }

// solution if visibility error
// function whoAmI() public override(ContractB, ContractC) pure returns (string memory) {

//     return ContractB.whoAmI();
// }


// Bad code example, do not use
//  function now reads from state, so it is no longer pure
function whoAmI() public override(ContractB, ContractC) view returns (string memory) {
    if(contractType == Type.ContractBType) {
        return ContractB.whoAmI();
    }
    if(contractType == Type.ContractCType) {
        return ContractC.whoAmI();
    }
    return "contract A";
}

function whoAmExternal() external pure returns (string memory) {
        return whoAmIInternal();
    }

}