// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;


/**
 * @title InheritanceSubmission
 * @dev Contract for deploying instances of Salesperson and EngineeringManager.
 */
contract InheritanceSubmission {
    address public salesPerson; // Address of the deployed Salesperson instance 0x1D96582361C6a034C4D18553dC21492eEB835F0e
    address public engineeringManager; // Address of the deployed EngineeringManager instance 0xa1e8151436F87C86aea4F7805bF5816E02D5c2e5

    /**
     * @dev Constructor to initialize the InheritanceSubmission contract.
     * @param _salesPerson Address of the deployed Salesperson instance.
     * @param _engineeringManager Address of the deployed EngineeringManager instance.
     */
    constructor(address _salesPerson, address _engineeringManager) {
        salesPerson = _salesPerson;
        engineeringManager = _engineeringManager;
    }
}
