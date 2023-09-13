//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity 0.8.19;

contract SellTokens is ERC20 {
    constructor(address _owner) ERC20("JOE Tokens", "JOE") {
        //this mints 10,000 tokens to the contract to be deployed
        _mint(_owner, 10_000e18);
    }
}
