// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FavoriteRecords {
    // Custom error
    error NotApproved(string albumName);
    
    // State variables
    mapping(string => bool) public approvedRecords;
    mapping(address => mapping(string => bool)) public userFavorites;
    
    // Array to keep track of approved record names for retrieval
    string[] private approvedRecordsList;
    
    constructor() {
        // Load approved records
        string[9] memory albums = [
            "Thriller",
            "Back in Black", 
            "The Bodyguard",
            "The Dark Side of the Moon",
            "Their Greatest Hits (1971-1975)",
            "Hotel California",
            "Come On Over",
            "Rumours",
            "Saturday Night Fever"
        ];
        
        for (uint i = 0; i < albums.length; i++) {
            approvedRecords[albums[i]] = true;
            approvedRecordsList.push(albums[i]);
        }
    }
    
    // Get all approved records
    function getApprovedRecords() public view returns (string[] memory) {
        return approvedRecordsList;
    }
    
    // Add record to user's favorites
    function addRecord(string memory albumName) public {
        if (!approvedRecords[albumName]) {
            revert NotApproved(albumName);
        }
        userFavorites[msg.sender][albumName] = true;
    }
    
    // Get user's favorite records
    function getUserFavorites(address user) public view returns (string[] memory) {
        string[] memory favorites = new string[](approvedRecordsList.length);
        uint count = 0;
        
        for (uint i = 0; i < approvedRecordsList.length; i++) {
            if (userFavorites[user][approvedRecordsList[i]]) {
                favorites[count] = approvedRecordsList[i];
                count++;
            }
        }
        
        // Create array with exact size
        string[] memory result = new string[](count);
        for (uint i = 0; i < count; i++) {
            result[i] = favorites[i];
        }
        
        return result;
    }
    
    // Reset user's favorites
    function resetUserFavorites() public {
        for (uint i = 0; i < approvedRecordsList.length; i++) {
            userFavorites[msg.sender][approvedRecordsList[i]] = false;
        }
    }
}
