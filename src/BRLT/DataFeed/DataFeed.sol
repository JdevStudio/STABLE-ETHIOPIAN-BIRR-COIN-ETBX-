pragma solidity ^0.5.12;

import "../ds-thing/thing.sol";

interface FeedAggregator {
    function poke() external;
}

/*
A DataFeed contract is a ds-value like contract that stores its value as a uint128 that is expected to be in 18 decimal fixed point notation.
When read, it is read as a bytes32 to maintain compatibility with ds-value.
*/
contract DataFeed is DSThing {

    uint128       val;
    uint32 public zzz;

    /*
    @notice Returns the latest value and flag
    */
    function peek() external view returns (bytes32, bool)
    {
        return (bytes32(val), block.timestamp < zzz);
    }

    function read() external view returns (bytes32)
    {
        require(block.timestamp < zzz, "XXX");
        return bytes32(val);
    }


    /*
    @notice Poke values to FeedAggregator
    @param val_ value
    @param zzz_ timstamp
    @param aggr_ reference for the feedAggregator object
    */
    function poke(uint128 val_, uint32 zzz_) external note auth
    {
        val = val_;
        zzz = zzz_;
    }

    /*
    @notice Post values to the FeedAggregator, but also poke
    @param val_ value
    @param zzz_ timestamp
    @param aggr_ reference for the feedAggregator object
    */
    function post(uint128 val_, uint32 zzz_, FeedAggregator aggr_) external note auth
    {
        val = val_;
        zzz = zzz_;
        aggr_.poke();
    }

    function void() external note auth
    {
        zzz = 0;
    }

}