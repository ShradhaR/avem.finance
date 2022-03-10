
const Likable = artifacts.require("./Likable.sol");

const minLikes = 0;

contract("Likable", function() {
  
   it("should not underflow", async () => {
    const likeable = await Likable.deployed();  
    await likeable.setLikes(minLikes);
    await likeable.remove();
    const result = await likeable.getLikes();
    assert.equal(result, minLikes, "Underflow is roll-overed.");
  });

});