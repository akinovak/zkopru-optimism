// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestERC20 is ERC20 {
    constructor() ERC20("ZKOPRU20", "ZRC") {
        _mint(msg.sender, 10000000000 ether);
    }
}