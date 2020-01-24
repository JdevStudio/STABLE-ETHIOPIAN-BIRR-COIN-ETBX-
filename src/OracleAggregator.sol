pragma solidity ^0.5.12;

import "../openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../openzeppelin-solidity/contracts/ownership/Ownable.sol";


interface IOracle {
    function getData() external returns (uint256, bool);
}

/* Computes Median from all providers */
/* Computes weighted average from all providers*/


contract OracleAggregator is Ownable, IOracle {
    using SafeMath for uint256;


    // Public variables

    //Addresses of authorized providers
    address[] public providers;

    // The minimum number of valid providers
    uint256 public minimumProviders = 1;


    event ProviderAdded(address provider);
    event ProviderRemoved(address provider);


    // Initialize the OracleAggregator
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
    @notice computes the median of data pushed by providers
    @return computed median value
        valid: flag indicating sucess or failure in the computation
    */
    function getConsolidatedData() external returns (uint256, bool) {

        // TODO: implement

    }



}