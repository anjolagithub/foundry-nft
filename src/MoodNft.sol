// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24; // Version of solidity

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";// Importing ERC721 contract from openzeppelin
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol"; // Importing Base64 contract from openzeppelin


contract MoodNft is ERC721 {
    uint256 private s_tokenCounter; // Counter to keep track of the number of NFTs minted
    string private s_sadSvgImageUri; // SVG for sad mood
    string private s_happySvgImageUri; // SVG for happy mood

    enum Mood {
        HAPPY,
        SAD
        }
    
        function generateTokenURI(uint256 tokenID, string memory imageURI) internal view returns (string memory) {
            return string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name": "',
                                name(),
                                '", "description" : "An NFT that reflects the owners mood.", "attributes": [{"trait_type": "moodiness", "value": 100 }], "image": "',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
        }
    mapping(uint256 => Mood) private s_tokenIdToMood;
    constructor(
        string memory _sadSvgImageUri, // Constructor to initialize the SVGs
        string memory _happySvgImageUri
    ) ERC721("MoodNft", "MNFT") {
        // Constructor to initialize the name and symbol of the NFT
        s_tokenCounter = 0;
        s_sadSvgImageUri = _sadSvgImageUri;
        s_happySvgImageUri = _happySvgImageUri; // Initialize the SVGs
    }
    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter); // Mint the NFT
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY; // Set the mood of the NFT to happy
        s_tokenCounter++; // Increment the counter
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenID) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenIdToMood[tokenID] == Mood.HAPPY) {
            imageURI = s_happySvgImageUri;
        } else {
            imageURI = s_sadSvgImageUri;
        }

        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name": "',
                            name(),
                            '", "description" : "An NFT that reflects the owners mood.", "attributes": [{"trait_type": "moodiness", "value": 100 }], "image": "',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }
};
