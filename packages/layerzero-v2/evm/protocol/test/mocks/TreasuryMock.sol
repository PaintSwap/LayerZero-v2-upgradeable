// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract TreasuryMock is Ownable {
    constructor() Ownable(_msgSender()) {}

    function withdraw() external onlyOwner {
        //withdraw
    }

    function withdrawAlt() external onlyOwner {
        //withdraw token
    }
}
