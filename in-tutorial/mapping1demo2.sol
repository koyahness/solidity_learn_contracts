// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RecordRegistry {

    // Returns true if an album name is approved
    mapping(string => bool) public approvedRecords;

    // Indexes user addresses to their personal favorite albums
    mapping(address => mapping(string => bool)) public userFavorites;

    constructor() {
        // Loading the approved albums during deployment
        approvedRecords["Thriller"] = true;
        approvedRecords["Back in Black"] = true;
        approvedRecords["The Bodyguard"] = true;
        approvedRecords["The Dark Side of the Moon"] = true;
        approvedRecords["Their Greatest Hits (1971-1975)"] = true;
        approvedRecords["Hotel California"] = true;
        approvedRecords["Come On Over"] = true;
        approvedRecords["Rumours"] = true;
        approvedRecords["Saturday Night Fever"] = true;
    }
    
    /**
     * @dev Allows a user to get getApprovedRecords.
     */
        function getApprovedRecords() public view returns (mapping) {
        return approvedRecords;
    }
    
    /**
     * @dev Allows a user to mark an album as a favorite.
     * @param _albumName The name of the album.
     */
    function markAsFavorite(string memory _albumName) public {
        userFavorites[msg.sender][_albumName] = true;
    }


    /**
     * @dev Allows a user to remove an album from their favorites.
     */
    function removeFavorite(string memory _albumName) public {
        userFavorites[msg.sender][_albumName] = false;
    }

}