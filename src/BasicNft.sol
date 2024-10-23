// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8.24;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter
    constructor() ERC721("Bougie", "BNFT") {
        s_tokenCounter = 0;
    }

    function mintNFT()  public {}

    function tokenURI( 
        uint256 tokenID

    ) public view override returns (string memory)
    {
  return

     }
}