/// SPDX-License-Identifier: MIT OR APACHE-2.0
pragma solidity >=0.8.0;

contract PhonyUser {
    function tryCall(address target, bytes memory data)
        public
        virtual
        returns (bool success, bytes memory returnData)
    {
        (success, returnData) = target.call(data);
    }

    function call(address target, bytes memory data)
        public
        virtual
        returns (bytes memory returnData)
    {
        bool success;
        (success, returnData) = target.call(data);

        if (!success) {
            if (returnData.length > 0) {
                assembly {
                    let returnDataSize := mload(returnData)
                    revert(add(32, returnData), returnDataSize)
                }
            } else {
                revert("REVERT_NULL_MESSAGE");
            }
        }
    }
}