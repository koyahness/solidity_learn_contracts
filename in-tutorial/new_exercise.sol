// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//knowledge of the new keyword.

contract AddressBook {

    address owner;

    constructor (){
        owner = msg.sender;
    }

    struct Contact {
       uint id;
       string firstName;
       string lastName;
       uint[] phoneNumbers;
    }

    Contact public contacts;



    error NotOwner(address _msg_sender);


    // add function
    function addContact(uint _id, string memory _firstName, string memory _lastName, uint[] memory _phoneNumbers) public {
        if (owner == msg.sender){
           contacts = Contact (
            _id,
            _firstName,
            _lastName,
            _phoneNumbers
           );


        } else {revert NotOwner(msg.sender);}

    }


    error ContactNotFound(uint _msg_sender);

    // remove contact function
    function deleteContact(uint _id) public returns (Contact memory){}

    if (owner == msg.sender){

        if(_id == contacts.id){

            return contacts[id];

        } else{revert ContactNotFound(_id)}


        } else {revert NotOwner(msg.sender);}

    //view function
    function getContact(uint _id) public {

         if(_id == contacts.id){

            delete contacts;

        } else{revert ContactNotFound(_id)}

    }

}


contract AddressBookFactory{

    AddressBook newContract = new AddressBook();
    
}