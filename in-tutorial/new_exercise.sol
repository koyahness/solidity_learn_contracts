// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//knowledge of the new keyword.

contract AddressBook {

    address owner;

    constructor {
        owner = msg.sender
    }

    struct Contact {
       uint id;
       string firstName;
       string lastName;
       uint[] phoneNumbers;
    }

    // add function
    function addContact() public {
        require (owner = msg.sender);

    }

    // remove function
    function removeContact() public {}

    //view function
    function viewContact() public {}

}


contract AddressBookFactory{

    AddressBook newContract = new AddressBook();
    
}