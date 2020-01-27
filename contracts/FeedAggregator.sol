pragma solidity 0.5.1;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./Stats.sol";

interface IOracle {
    function getData() external returns (uint256, bool);
}

/* Computes Median from all providers */
/* Computes weighted average from all providers*/


contract FeedAggregator is Ownable, IOracle  {
    using SafeMath for uint256;

    struct DataReport {
        uint256 timestamp;
        uint256 payload;
    }


    // Public variables

    //Addresses of authorized providers
    address[] public providers;

    // The minimum number of valid providers
    uint256 public minimumProviders = 1;


    uint256 public reportDelaySec = 90;

    // Aggregated Value
    uint128 val;

    // Has Value?
    bool public has;

    // Reports indexed by provider address. Report[0].timestamp > 0
    // indicates provider existence.
    mapping (address => DataReport[2]) public providerReports;

    event ProviderAdded(address provider);
    event ProviderRemoved(address provider);
    event ReportTimestampOutOfRange(address provider);
    event ProviderReportPushed(address provider, uint256 payload, uint256 timestamp);

    // Initialize the QuoteAggregator
    constructor(uint256 minimumProviders_) public {

        require(minimumProviders_ > 0, "Must have at least one provider");
    }


    // External functions

    /*
    @notice Sets the minimum number of valid data providers
    @param minimumProviders_ the new minimum value
    */
    function setMinimumProvider (uint256 minimumProviders_) external onlyOwner {

        require(minimumProviders > 0, "Must have at least one provider");

        minimumProviders = minimumProviders_;
    }

    /*
    @return the number of authorized providers.
    */
    function count()
        external
        view
        returns (uint256)
        {
            return providers.length;
    }

    /*
    @notice
    */
    function poke() external {
        (bytes32 val_, bool has_) = compute();
        val = uint128(val_);
        has = has_;
        //emit LogValue(val_);
    }

    function peek() external view returns (bytes32, bool) {
        return (bytes32(val), has);
    }

    function getData() external returns (uint256, bool) {
        return compute();
    }
    

    /*
    @notice computes the median of data pushed by providers
    @return computed median value
        valid: flag indicating sucess or failure in the computation
    */
    function compute() internal returns (uint256, bool) {

        uint256 validReportsCount = 0;
        uint256 dataFeederCount = providers.length;

        uint256[] memory validReports = new uint256[](dataFeederCount);

        for (uint256 i = 0; i < dataFeederCount; i++) {
            address providerAddress = providers[i];
            DataReport[2] memory reports = providerReports[providerAddress];
            validReports[validReportsCount++] = providerReports[providerAddress][0].payload;
        }

        if (dataFeederCount < minimumProviders) {
            return (0, false);
        }

        return (Stats.computeMedian(validReports, dataFeederCount), true);
    }

    /**
     * @notice Pushes a report for the calling provider.
     * @param payload is expected to be 18 decimal fixed point number.
     */
    function pushReport(uint256 payload) external
    {
        address providerAddress = msg.sender;
        DataReport[2] storage reports = providerReports[providerAddress];
        uint256[2] memory timestamps = [reports[0].timestamp, reports[1].timestamp];

        require(timestamps[0] > 0);

        uint8 index_recent = timestamps[0] >= timestamps[1] ? 0 : 1;
        uint8 index_past = 1 - index_recent;

        // Check that the push is not too soon after the last one.
        require(timestamps[index_recent].add(reportDelaySec) <= now);

        reports[index_past].timestamp = now;
        reports[index_past].payload = payload;

        emit ProviderReportPushed(providerAddress, payload, now);
    }

    /**
    * @notice Authorize a new provider to send reports to the Oracle 
      @param  Address of the provider
    */
     function addProvider(address provider) external onlyOwner
    {
        require(providerReports[provider][0].timestamp == 0);
        providers.push(provider);
        providerReports[provider][0].timestamp = 1;
        emit ProviderAdded(provider);
    }

    // TODO: implement removeProvider
    // TODO: implement 

    /**
     * @return The number of authorized providers.
     */
    function providersSize()
        external
        view
        returns (uint256)
    {
        return providers.length;
    }
}