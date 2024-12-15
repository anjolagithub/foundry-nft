
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;    // Version of solidity

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";    // Importing ERC721 contract from openzeppelin
import {Base64} from "@openzepplin/contracts/utils/Base64.sol"


contract MoodNft is ERC721{
    uint256 private s_tokenCounter;    // Counter to keep track of the number of NFTs minted
    string private s_sadSvgImageUri;    // SVG for sad mood
    string private s_happySvgImageUri;    // SVG for happy mood 



    constructor(
    string memory sadSvgImageUri,    // Constructor to initialize the SVGs
    string memory happySvgImageUri
    ) public ERC721("MoodNft", "MNFT") {    // Constructor to initialize the name and symbol of the NFT
        s_tokenCounter = 0;
        s_sadSvgImageUri = sadSvgUri;
        s_happySvgImageUri = happySvgUri;   // Initialize the SVGs


    }

    function mintNft() public {
        
        _safeMint(msg.sender, s_tokenCounter);    // Mint the NFT   
        s_tokenCounter++;    // Increment the counter   


    }
    function tokenURI(uint256 tokenID) public view override returns (string memory){
        string memory tokenMetaData = string.concat('{"name": name(), ''"}');
        
        if(tokenID % 2 == 0){
            return s_sadSvg;    // Return sad SVG if tokenID is even
        } else {
            return s_happySvg;    // Return happy SVG if tokenID is odd
        }
    }
}