// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "./mocks/ERC20Mintable.sol";


contract ERC20MintableTest is Test{
    ERC20Mintable e;
    address owner;
    function setUp() public{
        owner = address(this);
        e = new ERC20Mintable("Ethereum", "ETH");
    }

    function test_Mint() public{
        e.mint(500, owner);
        assertEq(e.balanceOf(owner), 500);
    }

    function test_Burn() public{
        e.mint(500, owner);
        e.burn(owner, 500);
        assertEq(e.balanceOf(owner), 0);
    }
}