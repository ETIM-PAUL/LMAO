//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity 0.8.19;

contract WLMAO is ERC20 {
    ERC20 LMAO;

    constructor(address _owner, address lmao) ERC20("JOE Tokens", "JOE") {
        //this mints 10,000 tokens to the contract to be deployed
        _mint(_owner, 10_000e18);
        LMAO = ERC20(lmao);
    }

    function depositLmao(uint _amount) public {
        LMAO.transferFrom(msg.sender, address(this), _amount);
        uint calculate = (92 * _amount) / 100;
        _mint(msg.sender, calculate);
    }

    function swapBack(uint _amount) public {
        require(
            balanceOf(msg.sender) >= _amount,
            "must be greater than amount"
        );
        LMAO.transfer(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }
}
