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
//it takes time and effort to manually deploy a new version of the contract for each customer.
//Luckily, there’s a way to write a contract that will act as a self-service portal for your customers.

contract ComplimenterFactory {

    function CreateComplimenter(string memory _name) public returns (address){
        new Complimenter(_name)
    }

}