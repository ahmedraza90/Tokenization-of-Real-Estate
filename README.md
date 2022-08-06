# Tokenization-of-Real-Estate

# A fully Digital Real Estate Marketplace Powered By Blockchain And Web3.0
### We are decentralising whole property dealing with web3.0
### This marketplace is able to fractionalise A property into shares that can be seperately Sold
# Web Flow
(https://user-images.githubusercontent.com/92223697/183254196-fb5e20f0-099d-4408-9902-4abff16a5e6c.png)


``` solidity 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract ERC721 is Initializable, ERC721Upgradeable, OwnableUpgradeable {
    using StringsUpgradeable for uint256;

    /// @notice the implementation of ERC721
    uint256 public implementation;

    /// @notice the new baseURI
    string private baseURIExtendend;
    string public propertyAddress;
    string public ownerName;

    /// @notice initialize the contract with the given name and symbol
    /// @param name_ the name of the collection
    /// @param symbol_ the symbol of the collection
    function initialize(string memory name_,
     string memory symbol_,
      string memory _propertyAddress,
      string memory _ownerName) 
      public initializer 
      {
        __ERC721_init(name_, symbol_);
        propertyAddress= _propertyAddress;
        ownerName=_ownerName;
    }
        function transferOwnership(address newOwner) public override virtual  {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }


    /// @notice Update the baseURI of the contract
    /// @param to_ address that the nft will be minted
    /// @param tokenId_ the id of the nft
    function mint(address to_, uint256 tokenId_) public  {
        _safeMint(to_, tokenId_);
    }

    /// @notice Update the baseURI of the contract
    /// @param baseURI_ the new baseURI
    function setBaseURI(string memory baseURI_) public onlyOwner {
        baseURIExtendend = baseURI_;
    }


    /// @notice Get the tokenURI of a token
    /// @param tokenId the tokenId
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = baseURIExtendend;
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }


}
```
