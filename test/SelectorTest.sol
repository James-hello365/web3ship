// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract SelectorTest {

    //状态变量,用于存储函数选择器
    bytes4 public storedSelector;
    
    //函数：计算输入值的平方
    function square(uint x) public pure returns (uint){
        return x * x;
    }
    //函数：计算输入值的两倍
    function double(uint x) public pure returns (uint){
        return 2 * x;
    }
    //函数：根据传入的选择器动态选择调用square或者double函数
    function executeFunction(bytes4 selector,uint x) public {
        //写法1
        if(selector == bytes4(keccak256("square(uint256)"))){
            square(x);
        }else if(selector == bytes4(keccak256("double(uint256)"))){
            double(x);
        }

        //写法2
        if(selector == bytes4(keccak256("square(uint256)"))){
            (bool success,bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
            require(success,"Function call square failed");
            abi.decode(data, (uint));
        }else if(selector == bytes4(keccak256("double(uint256)"))){
            (bool result,bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
            require(result,"Function call double failed");
            abi.decode(data, (uint));
        }
        
    }

    function setSelector(bytes4 selector) public{
        storedSelector = selector;
    }

    function executeStoredFunction(uint x) public returns (uint){
        require(storedSelector != bytes4(0),"storedSelector not set");
        (bool success,bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector, x));
        require(success,"function call failed");
        return abi.decode(data, (uint));
    }

}