// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

interface IChallengeable {
    event Slash(bytes32 blockHash, address proposer, string reason);
}
