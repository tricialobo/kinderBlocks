//architecting the contracts
//require that it's a user and that provenance is greater than 1 to:
// -this is a consortium
// -view updates-needs to be displayed beautifully
// -create updates-display
// -close a case: this also requires multiple signatures
// -create a block on this sidechain
// -kid photo-can combine w/ react-native/locally storage
// -if there's no updates on a case in some time, the contract should trigger contacting everyone who is part of the case
// -combine w/ ipfs in future
//-create update button. report missing(emails everyone). upon a good update thats verified, transfer eth to someone's account.
//login
//upon login - you can see the kids you work wtih only. this should be through the blockchain/store a pic locally


pragma solidity 0.4.24;

contract BlockFactory {
    address[] public deployedBlocks;
    address[] public users;

function createKinderBlock(uint intake) public {
    address newBlock = new KinderBlock(intake);
    deployedBlocks.push(newBlock);
}

function getDeployedBlocks() public view returns (address[]) {
    return deployedBlocks;
    }
}


contract KinderBlock {
    mapping (bytes32 => string) dataStorage;

    event Store(bytes32 indexed dataHash, address indexed owner, address indexed sender);


    function store(bytes32 dataHash, string data, address owner) public {
        dataStorage[dataHash] = data;
        Store(dataHash, owner, msg.sender);
    }

    function get(bytes32 dataHash) public view returns (string data) {
        data = dataStorage[dataHash];
    }
}