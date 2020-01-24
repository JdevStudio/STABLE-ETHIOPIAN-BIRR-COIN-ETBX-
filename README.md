# Brazilian Real Stable Coin - Project Overview 

This project is a tutorial around the creation of a Brazilian-real peggued stable coin based on ERC20 protocol on the Ethereum.

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

What makes a coin to be a stablecoin is an ability to exchange it for certain amount of underlying stable asset (fiat currency in this project), and people's trust that this ability will persist in future.

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

# Approachs for building a stable coin

## Faith-based

You create a token and declare it to be worth $1 (or something else). It is a weak system as it doesn't inspire any confidence. 
Confidence is the key ingredient of any currency. When the user base looses confidence in a given currency, it accelerate its devaluation. History showed this effect many times in periods of high expected inflation or wars.

## Collateral

Create a token and declare it to be worth $1. ‘Collateralize’ the token, meaning that every unit of this stablecoin is backed by $1 worth of assets. In a hypothetical situation, these assets could be anything from commodities to real estate or even real dollars sitting in a bank somewhere. Does this collateral have to provably exist? No! This is the [Tether](https://tether.to/faqs/) approach. They claim that each Tether is backed by a real dollar sitting in a bank, yet they refuse to provide proof. Therefore, all investors have to go on is their word. This is arguably better than the faith-based approach, but not by much.

## Collateral + Centralized 

Legitimate but centralized approach: Create a token and declare it to be worth $1. Declare that the token is collateralized, yet also comply with regulators and provide regular audits. This is the approach taken by TrueUSD, Gemini Dollar (GUSD), and Circle (USDC). Each unit of these stablecoins is provably backed by dollars sitting in a bank account, and they have the audits to prove it. If you can scoop up some of these coins for less than one dollar, you should, and then trade them in to the parent organization for a real dollar. After all, you know they have it due to their audits, and they’re obligated to redeem it because they’re regulated. It should be free money, and since everyone likes free money, this stablecoin should stay priced close to $1 at all times.

There is one critical drawback to this approach, however, and that is obviously the level of centralization. There are two subtle but distinct sources of centralization here. First, there exists a parent organization which, although currently complying with regulations, can theoretically be shut down if the government has a change of heart. Second, the collateral reserves are in the form of dollars sitting in the parent organization’s bank, meaning that even if the parent organization could somehow evade capture, the government could merely target the reserves, thereby ruining confidence in the entire system. Despite providing great utility, this level of centralization renders these stablecoins uninteresting from a cryptocurrency perspective, which prioritizes censorship-resistance.

## Legitimate and decentralized approach

Create a token and declare it to be worth $1. Declare that the token is collateralized. There is no need to provide audits, as the collateral can be independently verified on the blockchain. For the collateral, instead of dollars in a bank (remember, there is no bank), use native cryptocurrencies such as Ether, along with a mixture of other crypto-native tokens and securities (it is important to have diversified collateral, as will be seen shortly). In this model, there is no parent organization. There are no confiscatable reserves, except for the caveat of security tokens (we will also revisit this risk shortly). The goal is that if cryptocurrencies are used as collateral, the stablecoin built on top can also maintain censorship-resistance. Let’s take a deeper look into the mechanics.



## 

# Fiat-backed Stable Coin

The value of stablecoins of this type is based on the value of the backing currency, which is held by a third-party regulated financial entity.  In this setting, the trust in the custodian of the backing asset is crucial for the stability of price of the stablecoin. Fiat-backed stablecoins can be traded on exchanges and are redeemable from the issuer. The cost of maintaining the stability of the stablecoin is equivalent to the cost of maintaining the backing reserve and the cost of legal compliance, maintaining licenses, auditors and the business infrastructure required by the regulator.

Cryptocurrencies backed by fiat money are the most common and were the first type of stablecoins on the market. Their characteristics are:

- Their value is pegged to one or more currencies (most commonly the US dollar, also the Euro and the Swiss franc) in a fixed ratio,
- The tether is realized off-chain, through banks or other types of regulated financial institutions which serve as depositaries of the currency used to back the stablecoin,
- The amount of the currency used for backing of the stablecoin has to reflect the circulating supply of the stablecoin.

# Brazilian Real

The [Brazilian real](https://en.wikipedia.org/wiki/Brazilian_real) (sign: R$; code: BRL) is the official currency of Brazil. It is subdivided into 100 centavos. The Central Bank of Brazil is the central bank and the issuing authority.

The exchange rate as of September 2015 was BRL 4.05 to US$1.00.

# The code

The currency will be implemented as ERC-20 token on Ethereum, then the token smart contract does not need to have any special functionality. It will be a simple token with mint/burn ability.

Programming language: Solidity
Network: Ethereum
Ticker: BRLT
Underlying currency: Brazilian Real (BRL)

## Solidity Programming Language

[Solidity](https://solidity.readthedocs.io/) is an object-oriented programming language for writing smart contracts. It is used for implementing smart contracts on various blockchain platforms, most notably, Ethereum. Solidity was influenced by C++, Python and JavaScript and is designed to target the Ethereum Virtual Machine (EVM).

Solidity is statically typed, supports inheritance, libraries and complex user-defined types among other features. With Solidity we can create contracts for uses such as voting, crowdfunding, blind auctions, and multi-signature wallets.

## Tools

To run this project, you will need following tools:

- Remix Ethereum - online IDE for developing smart contracts on Ethereum blockchain
- MetaMask
- Etherscan
- [Rinkeby Authenticated Faucet](https://faucet.rinkeby.io/)

# Code structure

The contract BRLT implements the EIP20Interface abstract interface. Code below shows the contract constructor:

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

"10000","Brazilian Real Token","2","BRLT"

_initial= "10000"
_tokenName = "Brazilian Real Token"
_decimalUnits = "2"
_tokenSymbol = "BRLT"
