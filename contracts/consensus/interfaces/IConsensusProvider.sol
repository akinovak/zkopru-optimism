// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

interface IConsensusProvider {
    function openRoundIfNeeded() external;

    function lockForUpgrade(uint256 roundIndex) external;

    function isProposable(address proposer) external view returns (bool);
}
