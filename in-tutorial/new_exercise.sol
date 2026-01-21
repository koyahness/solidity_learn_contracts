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

    Contact[] public non_deleted_contacts;



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

           non_deleted_contacts.push(contacts);


        } else {revert NotOwner(msg.sender);}

    }


    error ContactNotFound(uint _msg_sender);

    // remove contact function
    function deleteContact(uint _id) public returns (Contact memory){

    if (owner == msg.sender){

        if(_id == contacts.id){

            delete contacts;

        } else{revert ContactNotFound(_id)}


        } else {revert NotOwner(msg.sender);}
}


    //view function
    function getContact(uint _id) public {

         if(_id == contacts.id){

            return contacts[id];

        } else{revert ContactNotFound(_id)}

    }

    //
    function getAllContacts() public returns (Contact[] memory) {
        return non_deleted_contacts;
    }

}


contract AddressBookFactory{

    function deploy () public returns (AddressBook) {
        // deploy AddressBook, owner = msg.sender

    AddressBook newAddressBookContract = new AddressBook(msg.sender);

    return newAddressBookContract; //newAddressBookContract.address

    }
    
}