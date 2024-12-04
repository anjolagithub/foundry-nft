
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;    // Version of solidity

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";    // Importing ERC721 contract from openzeppelin

contract MoodNft is ERC721{
    uint256 s_tokenCounter;    // Counter to keep track of the number of NFTs minted
    string private s_sadSvg;    // SVG for sad mood
    string private s_happySvg;    // SVG for happy mood 



    constructor(
    string memory sadSvgImageURi,    // Constructor to initialize the SVGs
    string memory happySvgImageURi
    ) public ERC721("MoodNft", "MNFT") {    // Constructor to initialize the name and symbol of the NFT
        s_tokenCounter = 0;
        s_sadSvg = sadSvgUri;
        s_happySvg = happySvgUri;   // Initialize the SVGs


    }

    function mintNft() public {
        
        _safeMint(msg.sender, s_tokenCounter);    // Mint the NFT   
        s_tokenCounter++;    // Increment the counter   


    }
    function tokenURI(uint256 tokenID) public view override returns (string memory){
        if(tokenID % 2 == 0){
            return s_sadSvg;    // Return sad SVG if tokenID is even
        } else {
            return s_happySvg;    // Return happy SVG if tokenID is odd
        }
    }
}