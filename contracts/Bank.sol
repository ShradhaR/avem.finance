//SPDX-License-Identifier: MIT
//solhint-disable-next-line
pragma solidity 0.7.0;
/**
* @title Bank Smart Contract
*
* @dev @notice This contract allows :
*               1. Get balance
*               2. Add balance into user account
*               3. Withdraw ALL balance from usr account
*
* @author Shradha Rajmane
*
*/

contract Bank {

/// @dev Lock userBalance to avoid concurrunt execution.
bool private _mutex;
/// @dev Protect Bank user balance from other contracts.
mapping (address => uint256) private userBalance;  

    
/// @notice Get balance
/// @return balance The balance of the user
function getBalance() public view returns(uint256 balance){
return userBalance[msg.sender];
}


/// @notice Add balance into Bank
function addToBalance() public payable
{
    require(!_mutex && (userBalance[msg.sender] + msg.value) > userBalance[msg.sender],
             "You can't add balance.");
    _mutex=true;
    userBalance[msg.sender] += msg.value;
    _mutex=false;
}


/// @notice Withdraw total balance from Bank
function withdrawBalance() public {
    require(!_mutex && userBalance[msg.sender] > 0, "You can't wirthdraw Balance.");
    _mutex=true;    

    userBalance[msg.sender] = 0;
    (bool success, ) = msg.sender.call{value : userBalance[msg.sender] }("Withdraw started");
    require(success, "Transfer failed.");

    // *Start Alternate approach
    //unit balance = userBalance[msg.Sender];
    //userBalance[msg.Sender] = 0;
    //msg.sender.transfer(balance);
    // *End Alternate approach
    
    _mutex = false;
}

}