/// @SPDX-License-Identifier: UPL-1.0
pragma solidity ^0.8.9;

/// @title Test Target
/// @dev simulates behaviors for testing 
// PhonyUser

contract TestTarget {
    /// @dev Always succeeds and returns data.
    function successFunction() external pure returns (string memory) {
        return "SUCCESS";
    }

    /// @dev Always reverts with a custom error message.
    function errorFunction() external pure {
        revert("CUSTOM_ERROR");
    }

    /// @dev Always reverts with empty data.
    function emptyRevertFunction() external pure {
        revert();
    }
}
