// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test{
    DeployBasicNft public deployer;
    
    BasicNft basicNft;

    function beforeAll() override internal {
        basicNft = new BasicNft();

}

}