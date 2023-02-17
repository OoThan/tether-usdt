// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import './SafeMath.sol';

/**
 *  @title ERC20Basic
 *  @dev Simpler version of ERC20 interface
 *  @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
    function totalSupply() public constant returns (uint);
    function balanceOf(address who) public view returns (uint);
    function transfer(address to, uint value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
}

/**
 *  @title Basic Token
 *  @dev Basic version of StandardToken, with no allowance.
 */
contract BasicToken is ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) balances;

    /**
     *  @dev transfer token for a specified address
     *  @param _to The address to transfer to
     *  @param _value The amount to be transferred.
     */
    function transfer(address _to, uint _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    /**
     *  @dev Gets the balance of the specified address.
     *  @param _owner The address to query the address of.
     *  @return An uint26 representing the amount owned by the passed address.
     */
    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
}
