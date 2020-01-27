pragma solidity 0.5.1;

import "./datafeed.sol";

contract DataFeedFactory {
    event Created(address indexed sender, address feed);
    mapping(address=>bool) public isFeed;

    function create() public returns (DataFeed) {
        DataFeed feed = new DataFeed();
        emit Created(msg.sender, address(feed));
        feed.setOwner(msg.sender);
        isFeed[feed] = true;
        return feed;
    }
}