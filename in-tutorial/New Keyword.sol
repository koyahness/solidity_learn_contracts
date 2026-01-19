// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// create a contract that creates other contracts.
//A contract factory is a contract that creates other contracts


//Imagine you want to create a contract that can store its owner’s name and complement it upon request. You can create this contract fairly easily.

contract Complimenter {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    function compliment() public view returns(string memory) {
        return string.concat("You look great today, ", name);
    }
}

contract ComplimenterFactory {

    function CreateComplimenter(string memroy _name) public returns (address){
        new Complimenter(_name)
    }

}