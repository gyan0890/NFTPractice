// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol';

contract GameItem is ERC721 {
    uint counter;
    mapping(uint => string) _tokenURIs;
    constructor() ERC721("GameItem", "ITM") { counter = 0; }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }
    
    
    /**
     * @dev Base URI for computing {tokenURI}. Empty by default, can be overriden
     * in child contracts.
     */
    function _baseURI() internal view virtual override returns (string memory) {
        return "https://somekindofs3link";
    }
    
    function awardItem(address player, string memory _tokenURI)
        public
        returns (uint256)
    {
        counter = counter+1;

        uint256 newItemId = counter;
        _mint(player, newItemId);
        _tokenURIs[newItemId] = string(abi.encodePacked(_baseURI(), _tokenURI));
        return newItemId;
    }
}
