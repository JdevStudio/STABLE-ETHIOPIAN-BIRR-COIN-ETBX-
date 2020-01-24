# Concepts

## Approachs for building a stable coin

### Faith-based

You create a token and declare it to be worth $1 (or something else). It is a weak system as it doesn't inspire any confidence. 
Confidence is the key ingredient of any currency. When the user base looses confidence in a given currency, it accelerate its devaluation. History showed this effect many times in periods of high expected inflation or wars.

### Collateral

Create a token and declare it to be worth $1. ‘Collateralize’ the token, meaning that every unit of this stablecoin is backed by $1 worth of assets. In a hypothetical situation, these assets could be anything from commodities to real estate or even real dollars sitting in a bank somewhere. Does this collateral have to provably exist? No! This is the [Tether](https://tether.to/faqs/) approach. They claim that each Tether is backed by a real dollar sitting in a bank, yet they refuse to provide proof. Therefore, all investors have to go on is their word. This is arguably better than the faith-based approach, but not by much.

### Collateral + Centralized 

Legitimate but centralized approach: Create a token and declare it to be worth $1. Declare that the token is collateralized, yet also comply with regulators and provide regular audits. This is the approach taken by TrueUSD, Gemini Dollar (GUSD), and Circle (USDC). Each unit of these stablecoins is provably backed by dollars sitting in a bank account, and they have the audits to prove it. If you can scoop up some of these coins for less than one dollar, you should, and then trade them in to the parent organization for a real dollar. After all, you know they have it due to their audits, and they’re obligated to redeem it because they’re regulated. It should be free money, and since everyone likes free money, this stablecoin should stay priced close to $1 at all times.

There is one critical drawback to this approach, however, and that is obviously the level of centralization. There are two subtle but distinct sources of centralization here. First, there exists a parent organization which, although currently complying with regulations, can theoretically be shut down if the government has a change of heart. Second, the collateral reserves are in the form of dollars sitting in the parent organization’s bank, meaning that even if the parent organization could somehow evade capture, the government could merely target the reserves, thereby ruining confidence in the entire system. Despite providing great utility, this level of centralization renders these stablecoins uninteresting from a cryptocurrency perspective, which prioritizes censorship-resistance.

### Legitimate and decentralized approach

Create a token and declare it to be worth $1. Declare that the token is collateralized. There is no need to provide audits, as the collateral can be independently verified on the blockchain. For the collateral, instead of dollars in a bank (remember, there is no bank), use native cryptocurrencies such as Ether, along with a mixture of other crypto-native tokens and securities (it is important to have diversified collateral, as will be seen shortly). In this model, there is no parent organization. There are no confiscatable reserves, except for the caveat of security tokens (we will also revisit this risk shortly). The goal is that if cryptocurrencies are used as collateral, the stablecoin built on top can also maintain censorship-resistance. Let’s take a deeper look into the mechanics.


## Fiat-backed Stable Coin

The value of stablecoins of this type is based on the value of the backing currency, which is held by a third-party regulated financial entity.  In this setting, the trust in the custodian of the backing asset is crucial for the stability of price of the stablecoin. Fiat-backed stablecoins can be traded on exchanges and are redeemable from the issuer. The cost of maintaining the stability of the stablecoin is equivalent to the cost of maintaining the backing reserve and the cost of legal compliance, maintaining licenses, auditors and the business infrastructure required by the regulator.

Cryptocurrencies backed by fiat money are the most common and were the first type of stablecoins on the market. Their characteristics are:

- Their value is pegged to one or more currencies (most commonly the US dollar, also the Euro and the Swiss franc) in a fixed ratio,
- The tether is realized off-chain, through banks or other types of regulated financial institutions which serve as depositaries of the currency used to back the stablecoin,
- The amount of the currency used for backing of the stablecoin has to reflect the circulating supply of the stablecoin.


## Blockchain Oracles

Blockchains and smart contracts cannot access data from outside of their network. In order to know what to do, a smart contract often needs access to in- formation from the outside world that is relevant to the contractual agreement, in the form of electronic data, also referred to as oracles. These oracles are services that send and verify real world occurrences and submit this information to smart contracts, triggering state changes on the blockchain.

Oracles feed the smart contract with external information that can trigger predefined actions of the smart contract. This external data stems either from so ware (Big-data application) or hardware (Internet-of-Things). Such a condition could be any data, like weather temperature, successful payment, or price fluctuations. However, it is important to note that a smart contract does not wait for the data from an outside source to ow into the system. The contract has to be invoked, which means that one has to spend network resources for calling data from the outside world. This induces network transaction costs. In the case of Ethereum, this would be “gas.”

There are different types of oracles:

* Software Oracles
handle information data that originates from online sources, like temperature, prices of commodities and goods, flight or train delays, etc. The so ware oracle extracts the needed information and pushes it into the smart contract.

* Hardware Oracles
Some smart contracts need information directly from the physical world, for example, a car crossing a barrier where movement sensors must detect the vehicle and send the data to a smart contract, or RFID sensors in the supply chain industry.

* Inbound Oracles
provide data from the external world.

* Outbound Oracles
provide smart contracts with the ability to send data to the outside world. An example would be a smart lock in the physical world, which receives payment on its blockchain address and needs to unlock automatically.

* Consensus-based Oracles
get their data from human consensus and prediction markets like Augur and Gnosis. Using only one source of information could be risky and unreliable. To avoid market manipulation, prediction markets implement a rating system for oracles. For further security, a combination of different oracles may be used, where, for example, three out of ve oracles could determine the outcome of an event.

The main challenge with oracles is that people need to trust these outside sources of information, whether they come from a website or a sensor. Since oracles are third-party services that are not part of the blockchain consensus mechanism, they are not subject to the underlying security mechanisms that this public infrastructure provides. One could replicate “man-in-the-middle attacks” standing between contracts and oracles.

The robustness assurance of this “second layer” is of utmost importance. Different trusted computing techniques can be used as a way of solving these issues. However, this topic will need more attention, as secure oracles are a bottleneck for smart contract security. If oracle security is not adequately provided, it will be a show stopper for widespread smart contract implementation.

You may find more information [here]](https://amzn.to/2jOj5JH).