contract PaymentReceiver {
    
    address payable owner;

    constructor() payable {
        owner = payable(msg.sender); // Convert msg.sender to payable
    }

    function receiveEther() public payable {
        // This function can receive Ether
    }

    function withdrawEther() public {
        owner.transfer(address(this).balance); // Send Ether to owner
    }
}