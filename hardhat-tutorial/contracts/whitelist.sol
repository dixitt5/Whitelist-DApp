// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract whitelist {
    uint8 public maxWhiteListedAddresses;
    uint8 public numAddressesWhiteListed;

    mapping(address => bool) public whiteListedAddresses;

    constructor(uint8 _maxWhiteListedAddresses) {
        maxWhiteListedAddresses = _maxWhiteListedAddresses;
    }

    function addAddressToWhiteList() public {
        require(
            !whiteListedAddresses[msg.sender],
            "Sender already in whitelist"
        );
        require(
            numAddressesWhiteListed < maxWhiteListedAddresses,
            "max limit reached"
        );
        whiteListedAddresses[msg.sender] = true;
        numAddressesWhiteListed += 1;
    }
}
