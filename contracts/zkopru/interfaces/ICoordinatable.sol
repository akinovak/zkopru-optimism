// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

interface ICoordinatable {
    event NewProposal(uint256 proposalNum, bytes32 blockHash);
    event Finalized(bytes32 blockHash);
    event MassDepositCommit(uint256 index, bytes32 merged, uint256 fee);
    event NewErc20(address tokenAddr);
    event NewErc721(address tokenAddr);
    event StakeChanged(address indexed coordinator);

    function register() external payable;

    function deregister() external;

    function stake(address coordinator) external payable;

    function safePropose(
        bytes calldata blockData,
        bytes32 parentHash,
        bytes32[] memory depositHashes
    ) external;

    function propose(bytes calldata blockData) external;

    function finalize(bytes calldata finalization) external;

    function withdrawReward(uint256 amount) external;

    function commitMassDeposit() external;

    function registerERC20(address tokenAddr) external;

    function registerERC721(address tokenAddr) external;

    function isProposable(address proposerAddr) external view returns (bool);
}
