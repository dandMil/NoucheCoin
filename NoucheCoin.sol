pragma solidity ^0.4.4;

import "./Token.sol";
import "./StandardToken.sol";

contract NoucheToken is StandardToken {

    function () {
        //if ether is sent to this address, send it back.
        throw;
    }

    /* Public variables of the token */

    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
    string public name;
    uint8 public decimals;
    string public symbol;
    string public version = 'H1.0';

    function NoucheToken(
    ) {
        balances[msg.sender] = 10000000;               // Give the creator all initial tokens (100000 for example)
        totalSupply = 10000000;                        // Update total supply (100000 for example)
        name = "NoucheCoin";                                   // Set the name for display purposes
        decimals = 0;                            // Amount of decimal for display purposes
        symbol = "NCH";                               // Set the symbol for display purposes
    }

    /* Approves and then calls the receiving contract */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}