# avem.finance

## Overview
### Bank.sol
This contract allows :
 1. Get balance
 2. Add balance into user account
 3. Withdraw ALL balance from usr account

<b>Test Coverage:</b>  Withrdraw and Deposit

### Likable.sol
UInteger Rollover Test Smart Contract :
 
Option 1. Rollover is needed in case of overflow or underflow. <br>
Option 2: Rollover is NOT needed in case of overflow and/or underflow. (e.g., customer balance). <br>
Further, Option 2 can be implemented using three approches: <br>
       a. SafeMath for solidity versions any <= or > 0.8. [safemath is expensive function] <br>
       b. Use solidity version >=0.8 which will handle rollover in case of overflow or underflow. <br>
       c. Use solidity version of this contract (i.e. 0.7.0) and add explicit logic to check overflow or underflow.   <br>          

<b>Test Coverage:</b> Underflow

## File Structure 
![image](https://user-images.githubusercontent.com/35179350/157581238-4a55a3f1-123a-4cb2-958a-da104dc03e0a.png)

## Test Results 

![image](https://user-images.githubusercontent.com/35179350/157581121-07f55deb-e89e-4714-8726-002d9ceca9e8.png)

## Installation Instructions for solhint
1. npm i -g solhint
2. solhint -V
3. solhint init-config 
4. solhint contracts/Bank.sol

