//SPDX-License-Identifier: MIT
//solhint-disable-next-line
pragma solidity 0.7.0; 

/**
* @title UInteger Rollover Test Smart Contract
*
* @dev @notice UInt256 roll-over use cases  - 
*    Option 1. Rollover is needed in case of overflow or underflow.
*    Option 2: Rollover is NOT needed in case of overflow and/or underflow. (e.g., customer balance).
*    Further, Option 2 can be implemented using three approches: 
*       a. SafeMath for solidity versions any <= or > 0.8. [safemath is expensive function]
*       b. Use solidity version >=0.8 which will handle rollover in case of overflow or underflow.
*       c. Use solidity version of this contract (i.e. 0.7.0) and add explicit logic to check overflow or underflow.            
*    Option 2.c,2.b and option 1 are implemented below. Becasue SafeMath is expensive function for this contract.
*    Comments are used to represent Option 1 and option 2.b. 
* @author Shradha Rajmane
*
*/

//Option 2.c

contract Likable {
uint256 public likes;
function remove() public {
    if (likes > 0)  
        likes --;
}
function add() public {
    uint256 overflowtest = likes + 1;
    if(overflowtest > likes) 
        likes ++;
}

function setLikes(uint256 _likes) public{
    likes = _likes;
}
function getLikes() public view returns(uint256){
    return likes;
}
}


/// @notice @dev Option 1 and option 2.b
/*
pragma solidity 0.8.0;
contract Likable {
uint256 public likes;
function remove() public {
    //Option 1: Use unchecked if rollover is needed depending of use case
    //unchecked{     
        likes--;
    //}
 
}
function add() public {
    //unchecked{
    likes++;
    //}   
}
} 
*/
