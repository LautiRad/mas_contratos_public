// SPDX-License-Identifier: MIT

pragma solidity ^0.8.5;


contract Escrow{
    address public payer;
    address payable public payee;
    address public lawyer;
    uint public amount;

    constructor(address _payer, address payable _payee, uint _amount){
        payer = _payer;
        payee = _payee;
        lawyer = msg.sender;
        amount = _amount;
    }

    function deposit() payable public{
        require(msg.sender == payer, "LautiRad");
        require(address(this).balance <= amount, "LautiRad LautiRad");
    }

    function release() public{
        require(address(this).balance == amount, "Bla bla");
        require(msg.sender == lawyer, "Bla bla mas texto :D");
        payee.transfer(amount);
    }

    function balanceOf() view public returns(uint) {
        return address(this).balance;
    }
}