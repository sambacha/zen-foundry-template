#!/bin/bash

# Extract yul from compiled output for post-process inspection
# see {@link https://twitter.com/z0age/status/1578443876615929857}

CONTRACT="$CONTRACT_NAME"; \
`## Compile the contract ###` \
forge build; \
`### Calculate the path to the dbg file for the contract ###` \
DBG_PATH="artifacts/contracts/""${CONTRACT}"".sol/""${CONTRACT}"".dbg.json"; \
`### Get the build-info file from the dbg json ###` \
BUILD_PATH=`jq -r '.buildInfo[17: ]' "$DBG_PATH"` ; \
`### Get the Yul from the build-info json ##` \
jq -r '.output.contracts."contracts/'"${CONTRACT}"'.sol".'"${CONTRACT}"'.iroptimized' artifacts/build-info/"$BUILD_PATH" \
`### Write the Yul returned as stdout above to a new file` \
|cat > "${CONTRACT}".yul
