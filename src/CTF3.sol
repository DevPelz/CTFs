// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Challenge {
    mapping(address => bool) private hasSolved1;
    mapping(address => uint) userPoint;
    address[] public champions;
    mapping(address => string) public Names;

    function passKey(uint8 _key) external {
        require(
            keccak256(abi.encode(_key)) ==
                0xbbe3212124853f8b0084a66a2d057c2966e251e132af3691db153ab65f0d1a4d,
            "invalid key"
        );
        hasSolved1[tx.origin] = true;
    }

    function getENoughPoint(string memory _name) external {
        require(hasSolved1[tx.origin], "go back and complete level 1");
        userPoint[tx.origin]++;
        msg.sender.call("");
        if (userPoint[tx.origin] == 4) {
            Names[tx.origin] = _name;
            // champions.push(tx.origin);
        } else {
            Names[tx.origin] = "";
            // champions.pop();
        }
    }

    function addYourName() external {
        require(
            keccak256(abi.encode(Names[tx.origin])) !=
                keccak256(abi.encode("")),
            "invalid point Accumulated"
        );
        champions.push(tx.origin);
    }

    function getAllwiners() external view returns (string[] memory _names) {
        _names = new string[](champions.length);
        for (uint i; i < champions.length; i++) {
            _names[i] = Names[champions[i]];
        }
    }
}

//CHALLANGE 1: 0xB51019Da91d8d8e0ee85f4644bB21C7982EF7C06;
