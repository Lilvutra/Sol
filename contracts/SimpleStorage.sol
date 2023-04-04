// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // the most stable version

// contract def - similar to a class in any object oriented programming
// solidity has multiple different types or primitive data types
// the four most basic types are boolean/bool(define some type of T/F), uint(unsigned interger-a whole number that is
// not negative or positive), int(negative or positive whole number), address, bytes
contract SimpleStorage {

    uint256 favNumber; //be specific about bits, it will automatically set 256 bits if you do not specify
    // specify visibility or else it automatically set iternal visibility(public, private, internal, external)
    mapping(string => uint256) public nameToFavNumber;

    struct People {
        uint256 favNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favNumber) public {
        favNumber = _favNumber;
        retrieve();
    }
    // view(disalllow any modifications of state), pure functions(disallow modifications & reading)

    function retrieve() public view returns(uint256){
        return favNumber;
    }

    // calldata(temporary var that cannot be modified), memory(temporary, modifiable), 
    // storage(permanent, modifiable var)
    // EVM can access and store information in six places
    //1: Stack, 2: Memory, 3: Storage, 4: Calldata, 5: Code, 6: Logs
    function addPerson(string memory _name, uint256 _favNumber) public {
        people.push(People(_favNumber, _name));
        nameToFavNumber[_name] = _favNumber;
    }
    
}
// 0xd9145CCE52D386f254917e481eB44e9943F39138
// everytime we change a state in the blockchain, we do it in a transaction

