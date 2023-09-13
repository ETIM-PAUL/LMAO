//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity 0.8.19;

contract LMAO is ERC20 {
    address owner;

    constructor(address _owner) ERC20("JOE Tokens", "JOE") {
        owner = _owner;
        //this mints 10,000 tokens to the contract to be deployed
        _mint(_owner, 10_000e18);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        //8% of lmao
        uint feeAmount = ((amount * 8) / 100);

        //92% of lmao
        uint expectedAmount = ((amount * 92) / 100);

        super._transfer(from, to, expectedAmount);

        super._transfer(from, owner, feeAmount);
    }
}
