// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {MyEnumerableERC721} from "../src/MyEnumerableERC721.sol";
import {MyERC721a} from "../src/MyERC721a.sol";

contract ERC721Test is Test {
    MyEnumerableERC721 public myEnumerableERC721;
    MyERC721a public myErc721a;

    address public user1;
    address public user2;

    function setUp() public {
        myEnumerableERC721 = new MyEnumerableERC721();
        myErc721a = new MyERC721a();
        user1 = makeAddr("user1");
        user2 = makeAddr("user2");
    }

    function test_mint_measure() public {
        vm.startPrank(user1);
        myErc721a.mint();
        myEnumerableERC721.mint();
        vm.stopPrank();
    }

    function test_transfer_measure() public {
        vm.startPrank(user1);
        myErc721a.mint();
        myErc721a.safeTransferFrom(user1, user2, 0);
        
        myEnumerableERC721.mint();
        myEnumerableERC721.safeTransferFrom(user1, user2, 0);
        vm.stopPrank();

    }

    function test_approve_measure() public {
        vm.startPrank(user1);
        myErc721a.mint();
        myErc721a.approve(user2, 0);
        
        myEnumerableERC721.mint();
        myEnumerableERC721.approve(user2, 0);
        vm.stopPrank();
    }

    function test_multiMint_measure() public {
        vm.startPrank(user1);
        myErc721a.multiMint();
        myEnumerableERC721.multiMint();
        vm.stopPrank();
    }
}
