const Bank = artifacts.require("./Bank.sol");

const ether = 10**18; // 1 ether = 1000000000000000000 wei
const initialBalance = 0 * ether;
const deposit = 2 * ether;

contract("Bank", function(accounts) {
  const user = accounts[1];
  
  describe('Deposit', function () {
  it("should deposit correct amount", async () => {
    const bank = await Bank.deployed();
    const result = await bank.addToBalance({from: user, value: web3.utils.toBN(deposit)});
    const depositedBalance = await bank.getBalance({from: user});
    assert.equal(depositedBalance, initialBalance + deposit,
      "bank balance should be increased." );
  });
 });


  describe('Withdraw', function () {
  it("should withdraw all amount", async () => {
    const bank = await Bank.deployed();  
    await bank.withdrawBalance({from: user});
    const balance = await bank.getBalance({from: user});
    assert.equal(balance, 0, "Withdraw amount incorrect");
  });
 }); 

  
});