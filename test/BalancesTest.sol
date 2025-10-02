// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BalancesTest{
    mapping (address=>uint) public balances;
    mapping (address=>uint[]) public transctions;

    function addBalance(uint amount) public {
        require(amount > 0 ,"Amount must be greater than zero");
        balances[msg.sender] += amount;
        transctions[msg.sender].push(amount);
    }

    function getBalance() public view returns (uint){
        return balances[msg.sender];
    }

    struct Transection{
        address name;
        uint num;
        uint gas;
    }

    function getTransections() view public returns(uint [] memory){
        return transctions[msg.sender];
    }

}