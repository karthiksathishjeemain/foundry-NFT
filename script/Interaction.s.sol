// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {Script} from "lib/forge-std/src/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract Interaction is Script {
    string PUG_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address recently_deployed_contract_address = DevOpsTools.get_most_recent_deployment("BasicNFT", block.chainid);
        mintNFT_on_Contract(recently_deployed_contract_address);
    }

    function mintNFT_on_Contract(address basicNFTaddress) public {
        vm.startBroadcast();
        BasicNFT(basicNFTaddress).mintNFT(PUG_URI);
        vm.stopBroadcast();
    }
}
