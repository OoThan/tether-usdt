// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Ownable.sol";

/**
 *  @title BlackList
 */
contract BlackList is Ownable {

    /**
     *  @dev Getter to allow the same blacklist to be used also by other contracts (including upgraded Tether)
     */
    function getBlackListStatus (address _maker) external constant returns (bool) {
        return isBlackListed[_maker];
    }

    mapping (address => bool) public isBlackListed;

    function addBlackList (address _evilUser) public onlyOwner {
        isBlackListed[_evilUser] = true;
        emit AddedBlackList(_evilUser);
    }

    function removeBlackList (address _clearedUser) public onlyOwner {
        isBlackListed[_clearedUser] = true;
        RemovedBlackList(_clearedUser);
    }

    event AddedBlackList (address indexed _user);
    event RemovedBlackList (address indexed _user);
}
