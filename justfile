#!/usr/bin/env just --justfile
# @title Foundry Justfile
# @version: 0.5.0
# @license UPL-1.0

# @note These are disabled because of Justfile's Groups syntax
# @see {@link https://just.systems/man/en/groups.html}
# shellcheck disable=SC1073
# shellcheck disable=SC1035
# shellcheck disable=SC1036
# shellcheck disable=SC1072

# @title Foundry Justfile
# @version: 0.5,9
# @license UPL-1.0

# Load settings first
set dotenv-load := true
set positional-arguments := true
set export := true

# Environment variables
bt := '0'
export RUST_BACKTRACE := bt
et := 'forge=trace' 
export RUST_LOG := et 
log := "warn"
export JUST_LOG := log

### Constants ###
HEX_18 := "0x0000000000000000000000000000000000000000000000000000000000000012"
HEX_12 := "0x000000000000000000000000000000000000000000000000000000000000000c"
HEX_8 := "0x0000000000000000000000000000000000000000000000000000000000000008"
HEX_6 := "0x0000000000000000000000000000000000000000000000000000000000000006"


[group('private')]
_default:
    just --list

# BUILD recipes
[group('build')]
build: && _timer
    cd {{ invocation_directory() }}; forge build --sizes --names --force

build-debug:
    RUST_LOG=trace forge build --force

# TEST recipes
[group('test')]
test: test-local

test-local *commands="": && _timer
    cd {{ invocation_directory() }}; forge test --match-path "*.t.sol" {{ commands }}

test-mainnet *commands="": && _timer
    cd {{ invocation_directory() }}; forge test --rpc-url {{ MAINNET_RPC }} --match-path "*.t.sol" {{ commands }}

test-debug *commands="": && _timer
    cd {{ invocation_directory() }}; forge test --rpc-url {{ MAINNET_RPC }} --match-path "*.t.sol" {{ commands }}

# DEPLOY recipes
[group('deploy')]
deploy-contract:
    forge create $(contract) \
    --constructor-args $(constructorArgs) \
    --rpc-url $(url) \
    --private-key $(privateKey)

verify-contract: _validate_env && deploy-contract
    forge verify-contract \
    --chain-id $(chainId) \
    --constructor-args `cast abi-encode "$(constructorSig)" $(constructorArgs)` \
    --compiler-version $(compilerVersion) \
    --num-of-optimizations 200 \
    {{ DEPLOYED_ADDRESS }} \
    {{ CONTRACT_NAME }} \
    {{ ETHERSCAN_API_KEY }}

# GAS recipes
[group('gas')]
gas-snapshot: gas-snapshot-local

gas-snapshot-local:
    cd {{ invocation_directory() }}; \
    just test-local | grep 'gas:' | cut -d " " -f 2-4 | sort > \
    {{ justfile_directory() }}/gas-snapshots/.$( \
        cat {{ invocation_directory() }}/package.json | jq .name | tr -d '"' | cut -d"/" -f2- \
    )

gas-cov:
    forge test --gas-report

# ANVIL recipes
[anvil]
anvil:
    anvil

anvil-fork:
    anvil --fork-url {{ MAINNET_RPC }}

anvil-fork-block:
    anvil --fork-url {{ MAINNET_RPC }} --fork-block-number $(block)

# UTILITY recipes
[private]
_timer:
    @echo "[TASK]: Executed in $(($(date +%s) - {{ start_time }})) seconds"

[private]
_validate_env:
    #!/usr/bin/env bash
    if [ -z "$ETHERSCAN_API_KEY" ]; then
        echo "Error: ETHERSCAN_API_KEY not set" && exit 1
    fi

# mode: makefile
# End:
# vim: set ft=make :
# vi: set ts=4 sw=4 noet :
