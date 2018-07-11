pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract AirDrop is Ownable {

    /**
     *
     */
    function authorize(address _contractAddress, uint _value) public {
        StandardToken token = StandardToken(_contractAddress);
        token.approve(this, _value);
    }

    /**
     * batch transfer for ERC20 token.(the same amount)
     *
     * @param _contractAddress ERC20 token address
     * @param _addresses array of address to sent
     * @param _value transfer amount
     */
    function batchTransferToken(address _contractAddress, address[] _addresses, uint _value) public {
        // data validate & _addresses length limit

        StandardToken token = StandardToken(_contractAddress);
        // transfer circularly
        for (uint i = 0; i < _addresses.length; i++) {
            token.transferFrom(msg.sender, _addresses[i], _value);
        }
    }
}
