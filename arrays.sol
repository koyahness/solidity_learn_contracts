// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] public senders;
    uint[] public timestamps;

    // Return the complete numbers array
    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    // Reset numbers array to initial value (1-10)
    // Using more gas-efficient approach without .push()
    function resetNumbers() public {
        // Clear the array first
        delete numbers;
        // Recreate with initial values
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    // Append array to existing numbers array
    function appendToNumbers(uint[] calldata _toAppend) public {
        for (uint i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    // Save timestamp with caller address
    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    // Filter timestamps after Y2K (January 1, 2000, 12:00am)
    // Unix timestamp: 946702800
    function afterY2K() public view returns (uint[] memory, address[] memory) {
        // First, count how many timestamps are after Y2K
        uint count = 0;
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                count++;
            }
        }

        // Create arrays with the correct size
        uint[] memory filteredTimestamps = new uint[](count);
        address[] memory filteredSenders = new address[](count);

        // Fill the arrays with filtered data
        uint index = 0;
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                filteredTimestamps[index] = timestamps[i];
                filteredSenders[index] = senders[i];
                index++;
            }
        }

        return (filteredTimestamps, filteredSenders);
    }

    // Reset senders array
    function resetSenders() public {
        delete senders;
    }

    // Reset timestamps array
    function resetTimestamps() public {
        delete timestamps;
    }
}
