// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ~0.8.0;

// use:
// import {IAddressResolver} from "..IAddressResolver.sol";
//   

/** 
// Ex.
//      resolve necessary addresses via an Address Resolver
    IAddressResolver addressResolver = IAddressResolver(_addressResolver);
        address <% name %> = addressResolver.getAddress({name: bytes32("<% NAME %>")});
*/

interface IAddressResolver {
    function getAddress(bytes32 name) external view returns (address);
}
    /// @notice returns the version of the Account
   // function VERSION() external view returns (bytes32);
