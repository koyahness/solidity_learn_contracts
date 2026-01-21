// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/** * @title AddressBook
 * @dev Manages a list of contacts with restricted access to the owner.
 */

contract AddressBook {

    // Using immutable for gas efficiency since owner is set once
    address public immutable owner;

    //define a struct of contact types
    struct Contact {
       uint id;
       string firstName;
       string lastName;
       uint[] phoneNumbers;
    }

 // Mapping for fast ID-based lookups
    mapping(uint => Contact) private contacts;
    // Array to keep track of all active IDs (for getAllContacts)
    uint[] private contactIds;

// Custom Errors
    error NotOwner(address caller);
    error ContactNotFound(uint contactId);
    error ContactAlreadyExists(uint contactId);

modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner(msg.sender);
        _;
    }
    
    //add contsructor for owner to be set when contract deployed
   constructor(address _owner) {
        owner = _owner;
    }

    /**
     * @dev 
     */
    function addContact(
        uint _id, 
        string memory _firstName, 
        string memory _lastName, 
        uint[] memory _phoneNumbers
    ) public onlyOwner {
        if (contacts[_id].id != 0) revert ContactAlreadyExists(_id);

        Contact memory newContact = Contact({
            id: _id,
            firstName: _firstName,
            lastName: _lastName,
            phoneNumbers: _phoneNumbers
        });

        contacts[_id] = newContact;
        contactIds.push(_id);
    }


    /**
     * @dev Deletes a contact by ID. In Solidity, "delete" resets the struct to default values.
     */
    function deleteContact(uint _id) public onlyOwner {
        if (contacts[_id].id == 0) revert ContactNotFound(_id);
        
        delete contacts[_id];
        
        // Note: To truly remove from contactIds array, you would need to loop or swap.
        // For simplicity here, we just delete the mapping entry.
    }
    
    
    /**
     * @dev Returns a specific contact. Made 'view' to avoid gas costs on calls.
     */
    function getContact(uint _id) public view returns (Contact memory) {
        if (contacts[_id].id == 0) revert ContactNotFound(_id);
        return contacts[_id];
    }

     /**
     * @dev 
     */
    function getAllContacts() public view returns (Contact[] memory) {
        Contact[] memory all = new Contact[](contactIds.length);
        for (uint i = 0; i < contactIds.length; i++) {
            all[i] = contacts[contactIds[i]];
        }
        return all;

}
}

contract {
    // Array to track all deployed address books
    address[] public deployedAddressBooks;

    function deploy() public returns (address) {
        // We pass msg.sender to the constructor so the person calling the factory
        // becomes the owner of the AddressBook, not the Factory contract itself.
        AddressBook newContract = new AddressBook(msg.sender);
        deployedAddressBooks.push(address(newContract));
        return address(newContract);
    }
}