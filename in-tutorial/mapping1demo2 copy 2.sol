// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RecordRegistry {

    // Returns true if an album name is approved
    mapping(string => bool) public approvedRecords;

    // A supporting array to keep track of album names for retrieval
    string[] private approvedList;

    // Indexes user addresses to their personal favorite albums
    mapping(address => mapping(string => bool)) public userFavorites;

    constructor() {
        // Loading the approved albums during deployment
        // We use a helper function to avoid repeating code
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

    // Helper function to update both the mapping and the array at the same time
    function _addRecord(string memory _name) private {
        approvedRecords[_name] = true;
        approvedList.push(_name);
    }

    /**
     * @dev Allows a user to get getApprovedRecords.
     */
        function getApprovedRecords() public view returns (string[] memory) {
        return approvedList;
    }
    

// Custom error definition for better gas efficiency
    error NotApproved(string albumName);

    /**
     * @dev Allows a user to mark an album as a favorite.
     * @param _albumName The name of the album.
     */

    function markAsFavorite(string memory _albumName) public {
        if (!approvedRecords[_albumName]) {
            // Revert with the custom error and the specific album name
            revert NotApproved(_albumName); //Adds an album to favorites ONLY if it is in the approved list.
        }
        // Add to the user's mapping
        userFavorites[msg.sender][_albumName] = true;
    }



    /**
     * @dev Allows a user to remove an album from their favorites.
     */
    function removeFavorite(string memory _albumName) public {
        userFavorites[msg.sender][_albumName] = false;
    }
    
    
    /**
     * @dev Retrieves a list of all favorite album names for a specific address.
     * @param _user The address to look up.
     */
        function getUserFavorites(address _user) public view returns (string[] memory) {

        // 1. Create a temporary array in memory to store matches.
        // It can't be longer than the total number of approved albums.
        
        string[] memory tempFavorites = new string[](approvedList.length);
        uint256 count = 0;

        // 2. Iterate through the master list of approved albums.
        for (uint256 i = 0; i < approvedList.length; i++) {
            string memory album = approvedList[i];
            
            // 3. Check if THIS specific user has favorited THIS specific album.
            if (userFavorites[_user][album]) {
                tempFavorites[count] = album;
                count++;
            }
        }

        // 4. Resize the array to remove empty slots before returning.
        string[] memory finalFavorites = new string[](count);
        for (uint256 j = 0; j < count; j++) {
            finalFavorites[j] = tempFavorites[j];
        }

        return finalFavorites;
    }
    

}