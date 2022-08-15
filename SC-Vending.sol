// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract VendingMachine {

    address public owner;
    mapping (address => uint) public cupcakeBalances;

    constructor() {
        
        owner = msg.sender;
        cupcakeBalances[address(this)] = 100;
    }

    function refill(uint amount) public {
        require(msg.sender == owner, "Solo el propietario puede recargar.");
        cupcakeBalances[address(this)] += amount;
    }

    function purchase(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "Debes pagar al menos 1 ETH por cupcake, Sí esta caro el cupcake xD");
        require(cupcakeBalances[address(this)] >= amount, "No hay suficientes cupcakes en stock para completar esta compra 8)");
        cupcakeBalances[address(this)] -= amount;
        cupcakeBalances[msg.sender] += amount;
    }
}
