# Sablier V2 🤝 Exactly Protocol

This repository contains several Forge scripts developed by the Sablier Labs team for Exactly Protocol. The scripts
generate Lockup Dynamic segments that emulate a polynomial function.

## Polynomial

The polynomial function emulated is:

```math
f(x) = -0.0001*x^2 + 0.7161*x + 8.0377
```

## Usage

Run the script like this, making sure to replace `ETH_FROM` with your wallet address:

```sh
# your address here
ETH_FROM=0x0000000000000000000000000000000000000000 \
forge script script/ExactlySchedule.s.sol \
--broadcast \
--ledger \
--mnemonic-derivation-paths  "m/44'/60'/0'/0" \
--rpc-url optimism \
--sig "run()" \
--verify \
--with-gas-price $(cast to-wei 5 gwei) \
-vvvv
```

## Helpers

Part of the Solidity code has been generated using the Python scripts located in the [data](/data) directory.

## Notes

- Run `foundryup` to ensure that you are running the latest version of Foundry
- The command above assumes that you are using a Ledger wallet connected to a computer via USB. If you wish to use a
  mnemonic instead, you can set it as a `$MNEMONIC` environment variable in a `.env` file. Check out the
  [`Base`](https://github.com/sablier-labs/v2-core/blob/d1157b49ed4bceeff0c4e437c9f723e88c134d3a/test/Base.t.sol)
  script.

## References

- [Sablier Docs](https://docs.sablier.com)
- [Exactly](https://exact.ly/)

## Caveat Emptor

This is experimental software and is provided on an "as is" and "as available" basis. Sablier Labs does not give any
warranties and will not be liable for any loss, direct or indirect through continued use of this codebase.

## License

This repo is licensed under GPL 3.0 or later.
