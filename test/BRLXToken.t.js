var BRLXToken = artifacts.require("./BRLXToken.sol");

contract('BRLXToken', function(accounts) {

    var tokenInstance;

    it('sets the total supply upon deployment', async () => {
        let instance = await BRLXToken.deployed();
        tokenInstance = instance;
        let totalSupply = await tokenInstance.totalSupply();

        assert.equal(totalSupply.toNumber(), 1000000, 'sets the total supply to 1000000');

        let adminAccount = accounts[0];
        let adminBalance = await tokenInstance.balanceOf.call(adminAccount);
        assert.equal(adminBalance.toNumber(), 1000000, 'it allocates initial supply to the admin account');
    })


    it('Transfers token ownership', async () => {
            let instance = await BRLXToken.deployed();
            tokenInstance = instance;

            let adminAccount = accounts[0];
            let otherAccount = accounts[1];

            // Test for transfer larger than balance
            try {
                await tokenInstance.transfer.call(otherAccount, 999999999999); // tries to send more money that we have
            }
            catch(error) {
                assert(error.message.indexOf('revert') >= 0, 'error message must contain revert');
            }
            
            // transfer 250k from admin to other 
            let receipt = await tokenInstance.transfer(otherAccount, 250000, { from: adminAccount});
            
            assert.equal(receipt.logs.length, 1, 'trigger one event');
            assert.equal(receipt.logs[0].event, 'Transfer', 'event should be "Transfer"');
            assert.equal(receipt.logs[0].args._from, accounts[0], 'logs the account tokens are transfered from');
            assert.equal(receipt.logs[0].args._to, accounts[1], 'logs the account tokens are transfered to');
            assert.equal(receipt.logs[0].args._value, 250000, 'logs the transfer amount');

            // Check admin's balance after transfer
            let adminBalance = await tokenInstance.balanceOf.call(adminAccount);
            assert.equal(adminBalance.toNumber(), 750000, 'expected 750k in admin account');
            
            // Check other's balance after transfer
            let otherBalance = await tokenInstance.balanceOf.call(otherAccount);
            assert.equal(otherBalance.toNumber(), 250000, 'expected 250k in other account');            
    })

})