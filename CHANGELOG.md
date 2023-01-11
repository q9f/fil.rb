Changelog
=========

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog], and this project adheres to
[Semantic Versioning].


Unreleased
----------

- Expose attribute readers for `PowerClaim` objects.


v0.4.0 - 2020-09-18
-------------------

- Add support `Filecoin.StateMinerPower` without any miner information, to
  obtain the network's aggregate mining power.


v0.3.0 - 2020-07-07
-------------------

- Add optional argument to extract the deal CID automatically from the response
  when submitting a proposal;
- Make wallet for deal proposals optional, falling back on the configured
  default wallet;
- Add configuration object to set default wallet for deal proposals;
- Fix defaults overriding provided nil values in `Filecoin::Client`;
- Add abstraction for deals and their state with client lifecycle helpers.


v0.2.0 - 2020-06-12
-------------------

- Expose the methods of `Filecoin::Client::Node` in `Filecoin` using its
  default constructor (loads from environment variables);
- Add support for `Filecoin.ClientGetDealInfo` through
  `Filecoin::Client#client_get_deal_info`;
- Add support for token authenticated API interaction;
- Add support for `Filecoin.ClientStartDeal` through
  `Filecoin::Client#client_start_deal`;
- Add types for storage deal creation;
- Add support for `Filecoin.ClientQueryAsk` through
  `Filecoin::Client#client_query_ask`;
- Add support for `Filecoin.NetPeers` through `Filecoin::Client#net_peers`.


v0.1.0 - 2020-06-04
-------------------

- Add `Filecoin::Client` with `#chain_head` matching the `Filecoin.ChainHead`
  method in the Filecoin Lotus Node API.


[Keep a Changelog]: https://keepachangelog.com/en/1.0.0/
[Semantic Versioning]: https://semver.org/spec/v2.0.0.html

