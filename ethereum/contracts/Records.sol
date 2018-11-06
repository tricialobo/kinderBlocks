pragma solidity 0.4.25;

contract RecordFactory {
    address[] public deployedBlocks;
    address[] public users;

    function createKinderBlock() public {
        address newBlock = new KinderBlock();
        deployedBlocks.push(newBlock);
    }

    function getDeployedBlocks() public view returns (address[]) {
        return deployedBlocks;
    }

    function createUser() public {
        address newUser = new User();
        users.push(newUser);
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

contract User {

    struct User {
        bool exists;
        uint registerBlocktime;
        uint provenance;
    }

    mapping(address => User) public users;

    function register()returns (bool) {
        require(!isUser(msg.sender));
        users[msg.sender] = User({
        exists: true,
        registerBlocktime: block.number,
        provenance: 0
        });
        return true;
    }
  
    function setProvenance(address user, uint provenance){
        require(isUser(user));
        users[user].provenance = provenance;
    }
        
    function isUser(address user) public returns (bool){
        return users[user].exists;
    }
    
}