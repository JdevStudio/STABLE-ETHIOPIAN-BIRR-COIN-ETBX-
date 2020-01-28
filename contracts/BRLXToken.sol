/*
BRLT - Brazilian Real Stable Coin
Implements EIP20 token standard: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
.*/
pragma solidity 0.5.1;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

import "./EIP20Interface.sol";

contract BRLXToken is EIP20Interface {

    string public name= "Brazilian Real Stablecoin";
    uint8  public decimals = 18;
    string public version  = "1";
    string public symbol = "BRLX";

    event Transfer (address indexed _from, address indexed _to, uint256 _value);

    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    uint256 constant private MAX_UINT256 = 2**256 - 1;

    constructor(
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol
    ) public {
        balances[msg.sender] = _initialAmount;               // Give the creator all initial tokens
        totalSupply = _initialAmount;                        // Update total supply
        name = _tokenName;                                   // Set the name for display purposes
        decimals = _decimalUnits;                            // Amount of decimals for display purposes
        symbol = _tokenSymbol;                               // Set the symbol for display purposes
    }

    // // Returns the name of the token
    // function name() public view returns (string memory) {
    //     return name;
    // }

    // // Returns the ticker of the token
    // function symbol() public view returns (string memory) {
    //     return symbol;
    // }

    // // Returns the number of decimals the token uses.
    // function decimals() public view returns (uint8) {
    //     return decimals;
    // }

    function transfer(address _to, uint256 _value) public returns (bool success) {

        require(balances[msg.sender] >= _value, "insuficient balance"); // doesn't have enought tokens
        balances[msg.sender] -= _value; // debit from msg.sender
        balances[_to] += _value; // add to _to's account
        emit Transfer(msg.sender, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value, "insuficient balance");
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}