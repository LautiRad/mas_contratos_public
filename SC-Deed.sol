// SPDX-License-Identifier: MIT

pragma solidity ^0.8.5;


contract Deed{
    address public add1;
    address payable public add2;
    uint public earliest;

    constructor(address _add1, address payable _add2, uint fromNow)payable{
        add1 = _add1;
        add2 = _add2;   //Esta es la cuenta que va a recibir
        earliest = block.timestamp + fromNow;
    }

    function withdraw() public{
        require(msg.sender==add1,"Add1 solo puede pagar, no puede recibir :)");
        require(block.timestamp>=earliest,"Demasiado pronto para el pago :)");
        add2.transfer(address(this).balance);
    }
}