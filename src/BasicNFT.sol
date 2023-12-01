// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    mapping(uint256 tokenID => string tokenURI) private s_tokenID_to_URI;
    uint256 tokenID;

    constructor() ERC721("Cuttie", "CAT") {
        tokenID = 0;
    }

    function mintNFT(string memory _tokenURI) public {
        s_tokenID_to_URI[tokenID] = _tokenURI;
        _safeMint(msg.sender, tokenID);
        tokenID = tokenID + 1;
    }

    function tokenURI(uint256 _tokenID) public view override returns (string memory) {
        return s_tokenID_to_URI[_tokenID];
    }
}
