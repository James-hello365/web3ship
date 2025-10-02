// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayTest{
    address[] public addressArray;

    function addAddress(address _address) public {
        addressArray.push(_address);
    }

    function getAddressArray() public view returns (address[] memory)  {
        return addressArray;
    } 

    function removeAddress(address _address) public{
        for(uint i = 0; i < addressArray.length; i++){
            if(addressArray[i] ==_address){
                addressArray[i] == addressArray[addressArray.length - 1];//将数组中最后一位的地址指向第i位;
                addressArray.pop();
            }
        }
    }

    function sumArray(uint[] memory _array) public pure  returns(uint result){
        for(uint i = 0; i < _array.length; i++){
            result += _array[i];
        }
    }
}
