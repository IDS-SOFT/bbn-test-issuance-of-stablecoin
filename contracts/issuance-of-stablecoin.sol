// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Stablecoin is ERC20, Ownable {
    uint256 public totalSupplyLimit;
    address public minter;

    event CheckBalance(string text, uint amount);

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply,
        uint256 _supplyLimit
    ) ERC20(_name, _symbol) {
        _mint(msg.sender, _initialSupply * (10**uint256(_decimals)));
        totalSupplyLimit = _supplyLimit * (10**uint256(_decimals));
        minter = msg.sender;
    }

    modifier onlyMinter() {
        require(msg.sender == minter, "Only the minter can call this function");
        _;
    }

    // Mint new tokens up to the supply limit
    function mint(address _account, uint256 _amount) external onlyMinter {
        require(totalSupply() + _amount <= totalSupplyLimit, "Exceeds supply limit");
        _mint(_account, _amount);
    }

    // Change the minter address
    function changeMinter(address _newMinter) external onlyOwner {
        minter = _newMinter;
    }
    
    function getBalance(address user_account) external returns (uint){
    
       string memory data = "User Balance is : ";
       uint user_bal = user_account.balance;
       emit CheckBalance(data, user_bal );
       return (user_bal);

    }
}
