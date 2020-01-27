/*
BRLT - Brazilian Real Stable Coin
Implements EIP20 token standard: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
.*/
pragma solidity 0.5.1;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

import "./EIP20Interface.sol";

contract BRLT is EIP20Interface {

    uint256 constant private MAX_UINT256 = 2**256 - 1;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    string public constant _name= "Brazilian Real Stablecoin";
    uint8 public constant _decimals = 18;
    string public constant _version  = "1";
    string public constant _symbol = "BRLT";

    constructor(
        uint256 initialAmount,
        string memory tokenName,
        uint8 decimalUnits,
        string memory tokenSymbol
    ) public {
        balances[msg.sender] = initialAmount;               // Give the creator all initial tokens
        totalSupply = initialAmount;                        // Update total supply
        _name = tokenName;                                   // Set the name for display purposes
        _decimals = decimalUnits;                            // Amount of decimals for display purposes
        _symbol = tokenSymbol;                               // Set the symbol for display purposes
    }

    // Returns the name of the token
    function name() public view returns (string memory) {
        return _name;
    }

    // Returns the ticker of the token
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    // Returns the number of decimals the token uses.
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value, "insuficient balance");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
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