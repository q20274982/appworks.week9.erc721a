// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "ERC721A/ERC721A.sol";

contract MyERC721a is ERC721A {
    constructor() ERC721A("MyERC721a", "MEA") {}

    function mint() public {
        _safeMint(msg.sender, 1);
    }

    function multiMint() public {
        _safeMint(msg.sender, 3);
    }
}