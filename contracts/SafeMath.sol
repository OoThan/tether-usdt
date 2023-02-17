// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

/**
 *  @title SafeMath
 *  @dev Math operation with safety checks that throw on error
 */
library SafeMath {
    function mul(uint a, uint b) internal pure returns (uint) {
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint a, uint b) internal pure returns (uint) {
//        assert(b > 0); // solidity automatically throws when dividing by 0
        uint c = a / b;
//        assert(a == b * c + a % b); // there is no case in which this doesn't hold
        return c;
    }

    function sub(uint a, uint b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        assert(c >= a);
        return c;
    }
}
