// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "hardhat/console.sol";

import {ITalentToken} from "../TalentToken.sol";
import {TalentFactory} from "../TalentFactory.sol";
import {IVirtualTAL} from "./VirtualTAL.sol";

interface ITalentFactoryV3 {
    /// Returns true is a given address has a registered Talent Token
    ///
    /// @param addr address of the talent
    /// @return true if the address has a talent token
    function hasTalentToken(address addr) external view returns (bool);
}

contract TalentFactoryV3 is TalentFactory, ITalentFactoryV3 {
    function isV3() public pure virtual returns (bool) {
        return true;
    }

    function hasTalentToken(address addr) public view override(ITalentFactoryV3) returns (bool) {
        return talentsToTokens[addr] != address(0x0);
    }

    function addAddressToTokensToTalents(address talentAddress, address tokenAddress)
        public
        onlyRole(DEFAULT_ADMIN_ROLE)
        returns (bool)
    {
        tokensToTalents[talentAddress] = tokenAddress;

        return true;
    }
}
