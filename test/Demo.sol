// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/draft-ERC721Votes.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Ownable{

    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender,"you are not the owner");
        _;
    }

    function sayHello() virtual public pure returns (string memory){
        return "hello,my owner";
    }

    function getContractAddress() public view returns (address){
        return address(this);
    }
}

contract MyContract is Ownable{

    uint countSayHello;

    using Strings for uint256;

    event hello(string content);

    function changeOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }

    function sayHello() override public pure returns (string memory){
        return "hello,the son of my owner";
    }

    function sayHelloSon() public returns (string memory){
        countSay();
        return "hello,the son of my owner";
    }

    
    function countSay() public{
        countSayHello ++;
        string memory helloworld = string.concat("hello,",countSayHello.toString(),"times");
        emit hello(helloworld);
    
    }

    function getSonContractAddress() public view returns (address){
        return address(this);
    }

}
//0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99