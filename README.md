# Brazilian Real Stable Coin - Project Overview 

This project is a exercise around the creation of a Brazilian-real peggued stable coin based on ERC20 protocol on the Ethereum. 

The proposed coin will have its price around 1.0 BRL, enforced by a Seigniorage algorithm that issues more coins when the price rises and reduces supply when the price falls.

# Stable Coins

[Stable Coins](https://en.wikipedia.org/wiki/Stablecoin) are cryptocurrencies design to minimize the price's volatility relative to some asset or basket of assets.

Advantages of a fiat-currency backed cryptocurrencies are that coins are stabilized by assets that fluctuate outside of the cryptocurrency space, that is, the underlying asset is not correlated, reducing financial risk. 

Bitcoin and altcoins are highly correlated, so that cryptocurrency holders cannot escape widespread price falls without exiting the market or taking refuge in asset backed stablecoins. 

Furthermore, such coins, assuming they are managed in good faith, and have a mechanism for redeeming the asset/s backing them, are unlikely to drop below the value of the underlying physical asset, due to arbitrage. Backed stablecoins are subject to the same volatility and risk associated with the backing asset.

If the backed stablecoin is backed in a decentralized manner, then they are relatively safe from predation, but if there is a central vault, they may be robbed, of suffer loss of confidence.

There are three main categories of stable coins:

- Centralized / IOU: A centralised controller holds an asset and creates IOUs that can be traded back in for the asset at a later date. Ex: TrueUSD & Gemini Dollar.
- Collateralised: Coin is issued in response to collateral being pledged. Value is kept stable by various means. Ex: DAI & Synthetix.
- Algorithmic (also called Seigniorage Shares ): Value of the coin is kept stable by algorithmically expanding or contracting the supply of coins in circulation. Ex: Terra & Ampleforth.

What makes a coin to be a stablecoin is an ability to exchange it for certain amount of underlying stable asset (fiat currency in this project), and people's trust that this ability will persist in future. BRLX uses the Algorithmic approach.

## Benefits

A crypto stable coins offer following benefits:

- In case, the fiat currency crashes in value (due to inflation or risk of maxi-devaluation); local citizens can exchange the crashed money for EUR-backed, USD-backed, or asset-backed stablecoins before they lose their savings. In this way, people get protected from further drops in the value of the local currency.
- Stablecoins can be used like any other currency for day-to-day purposes. From buying morning coffee to transferring funds to the family, we can use a digital wallet to pay with stable coins without potentialyl high-fees associated with the credit/debit card and banking services
- The stable currency is especially beneficial for overseas payments, as there is no need to convert different fiat currencies. A person in China could receive BRL-backed stablecoins without converting them into Yuan.
- Simplifying P2P and recurring payments: an employer can deploy a smart contract that automatically transfers stable coins as a salary to employees at the end of the month. It is especially helpful for organizations that have employees all over the world. It will reduce the high fees and a long process of exchanging fiat currency from a bank account in New York to a European bank account.
- Quick and affordable remittances for migrant workers: migrant workers send payments through platforms like Western Union to transfer money back to their loved ones and family. This complete process is quite expensive and slow due to which families lose a big chunk of funds due to high fees. Stablecoins can be a better alternative to this problem as workers and their families can use digital wallets across the globe to transfer stablecoins instantly with low fees and no volatility.

## Risk Factors

- Government intervention
- Reputation risk, usually related to the perceived probability of the stablecoin not being backed 1-to-1 by the related asset.

## Ideal Stablecoin

- [Censorship-resistant](https://medium.com/@cyrus.younessi/an-introduction-to-censorship-resistant-store-of-value-c5f4a24ca8a0) and decentralization: to be safe against governments
- Publicaly auditable stability: the user base should be able to independently verify its legitimacy.

# Brazilian Real

The [Brazilian real](https://en.wikipedia.org/wiki/Brazilian_real) (sign: R$; code: BRL) is the official currency of Brazil. It is subdivided into 100 centavos. The Central Bank of Brazil is the central bank and the issuing authority.

The exchange rate as of September 2015 was BRL 4.05 to US$1.00.

# The code

The currency will be implemented as ERC-20 token on Ethereum, then the token smart contract does not need to have any special functionality. It will be a simple token with mint/burn ability.

Programming language: Solidity
Network: Ethereum
Ticker: BRLX
Underlying currency: Brazilian Real (BRL)

## Solidity Programming Language

[Solidity](https://solidity.readthedocs.io/) is an object-oriented programming language for writing smart contracts. It is used for implementing smart contracts on various blockchain platforms, most notably, Ethereum. Solidity was influenced by C++, Python and JavaScript and is designed to target the Ethereum Virtual Machine (EVM).

Solidity is statically typed, supports inheritance, libraries and complex user-defined types among other features. With Solidity we can create contracts for uses such as voting, crowdfunding, blind auctions, and multi-signature wallets.

## Tools

To run this project, you will need following tools:

- Truffle
- Remix Ethereum - online IDE for developing smart contracts on Ethereum blockchain
- MetaMask
- Etherscan
- [Rinkeby Authenticated Faucet](https://faucet.rinkeby.io/)

## Compilation

```
# truffle install
$ truffle compile
```

## Code structure

The contract BRLX implements the EIP20Interface abstract interface. Code below shows the contract constructor:

```javascript
constructor(
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol
    ) public {
        balances[msg.sender] = _initialAmount;               // Give the creator all initial tokens
        totalSupply = _initialAmount;                        // Update total supply
        name = _tokenName;                                   // Set the name for display purposes
        decimals = _decimalUnits;                            // Amount of decimals for display purposes
        symbol = _tokenSymbol;                               // Set the symbol for display purposes
    }
```

## Contract parameters for testing

"10000","Brazilian Real Token","2","BRLX"

_initial= "10000"
_tokenName = "Brazilian Real Token"
_decimalUnits = "2"
_tokenSymbol = "BRLX"

