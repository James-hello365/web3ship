// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GlobalVary{

    function testBlock() view public {
        uint gaslimit  = block.gaslimit;
        uint chainid = block.chainid;
        address coinbase = block.coinbase;
    }

    function testBlock1() public view returns(uint){
        return block.number;
    }
}