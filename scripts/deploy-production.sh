#!/usr/bin/env bash
if [ -z "$args" ]; then
  forge create ./src/${contract}.sol:${contract} -i --rpc-url $rpc
else
  forge create ./src/${contract}.sol:${contract} -i --rpc-url $rpc --constructor-args ${args}
fi
