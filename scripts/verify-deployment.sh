if [ -z "$args" ]; then
  forge verify-contract --compiler-version "$version" $deployed ./src/${contract}.sol:${contract} $etherscan
else
  forge verify-contract --compiler-version "$version" $deployed ./src/${contract}.sol:${contract} $etherscan --constructor-args ${args}
fi
