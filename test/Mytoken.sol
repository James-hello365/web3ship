// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC20Permit.sol";

contract Mytoken is ERC20,ERC20Permit{

     constructor() ERC20("Mytoken","MTK") ERC20Permit("Mytoken") {
        _mint(msg.sender, 10000000);
     }
}


