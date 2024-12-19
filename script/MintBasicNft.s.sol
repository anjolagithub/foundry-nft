// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    // IPFS URI for the NFT metadata
    string public PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        // Get the most recently deployed BasicNft contract address
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        // Mint the NFT using the contract address
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address _contractAddress) public {
        // Start broadcasting the transaction
        vm.startBroadcast();
        BasicNft basicNft = BasicNft(_contractAddress);
        // Mint the NFT using the PUG URI
        basicNft.mintNFT(PUG);
        // Stop broadcasting the transaction
        vm.stopBroadcast();
    }
}
