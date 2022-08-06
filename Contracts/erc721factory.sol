
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "./erc721contract.sol";

contract ERC721Factory {
    address public implementation;
    address public clone;

    constructor() {
        implementation = address(new ERC721());
    }

    function create(string calldata name_, string calldata symbol_,string memory _propertyAddress,string memory _ownerName) external returns (address) {
        clone = Clones.clone(implementation);
        ERC721(clone).initialize(name_, symbol_,_propertyAddress,_ownerName);
        ERC721(clone).transferOwnership(msg.sender);
        return clone;
    }
}