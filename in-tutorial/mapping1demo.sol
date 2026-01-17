// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FavoriteRecords{

//A public mapping to check if an album name is officially approved.
//Accessing this via a getter: approvedRecords("Album Name") -> returns bool
mapping (string => bool) public approvedRecords;

//A nested mapping: User Address => (Album Name => Is Favorite)
//This allows each user to have their own private list of favorites.
mapping (address => mapping(string => bool)) public userFavorites;

/**
     * @dev Function to add an album to the approved list.
     * @param _albumName The name of the record to approve.
     */
    function addApprovedRecord(string memory _albumName) public {
        approvedRecords[_albumName] = true;
    }

    /**
     * @dev Function for a user to toggle an album as their favorite.
     * @param _albumName The name of the record to favorite.
     */
    function toggleFavorite(string memory _albumName) public {
        // We flip the current boolean value (true to false, or false to true)
        userFavorites[msg.sender][_albumName] = !userFavorites[msg.sender][_albumName];
    }

}