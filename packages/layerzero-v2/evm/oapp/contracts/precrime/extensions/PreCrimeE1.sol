// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import { SafeCast } from "@openzeppelin/contracts/utils/math/SafeCast.sol";

import { ILayerZeroEndpoint } from "@layerzerolabs/lz-evm-v1-0.7/contracts/interfaces/ILayerZeroEndpoint.sol";

import { PreCrimeUpgradeable } from "../PreCrimeUpgradeable.sol";

abstract contract PreCrimeE1Upgradeable is PreCrimeUpgradeable {
    using SafeCast for uint32;

    uint32 internal immutable localEid;

    constructor(uint32 _localEid, address _endpoint, address _simulator) PreCrimeUpgradeable(_endpoint, _simulator) {
        localEid = _localEid;
    }

    /**
     * @dev Ownable is not initialized here on purpose. It should be initialized in the child contract to
     * accommodate the different version of Ownable.
     */
    function __PreCrimeE1_init() internal onlyInitializing {}

    function __PreCrimeE1_init_unchained() internal onlyInitializing {}

    function _getLocalEid() internal view override returns (uint32) {
        return localEid;
    }

    function _getInboundNonce(uint32 _srcEid, bytes32 _sender) internal view override returns (uint64) {
        bytes memory path = _getPath(_srcEid, _sender);
        return ILayerZeroEndpoint(lzEndpoint).getInboundNonce(_srcEid.toUint16(), path);
    }

    function _getPath(uint32 _srcEid, bytes32 _sender) internal view virtual returns (bytes memory);
}
