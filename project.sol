// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyCustomToken is ERC20 {
    uint public maxTransaction = 800;
    address private _owner;

    mapping(address => uint256) public balances;

    constructor() ERC20("My Custom Token", "MCT") {
        _owner = msg.sender;
        _mint(msg.sender, 10 * 10 ** decimals()); // Mint 10 tokens initially to the contract deployer
    }

    modifier onlyOwner {
        require(msg.sender == _owner, "Only owner can use this");
        _;
    }

    function deposit(address _address, uint256 _number) public onlyOwner {
        require(_number > 0, "Amount must be greater than 0");
        _mint(_address, _number);
        balances[_address] += _number;
    }

    function withdraw(address _address, uint256 _number) public {
        require(balances[_address] >= _number, "Insufficient balance");

        if (_number > maxTransaction) {
            revert("Transaction amount exceeds maximum allowed");
        }

        _burn(_address, _number);
        balances[_address] -= _number;
    }

    function changeMaxTransaction(uint256 _newMax) public onlyOwner {
        maxTransaction = _newMax;
    }

    function owner() public view returns (address) {
        return _owner;
    }
}
