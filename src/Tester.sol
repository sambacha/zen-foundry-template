/// SPDX-License-Identifier: UPL-1.0
pragma solidity ^0.8.19;

/// @custom:warning ⚠️ Intentionally Verbose amount of comments

/* 
 * 📍 TECHNICAL NOTES
 * 1. The contract uses ^0.8.19 which includes important safety features like:
 *    - Overflow/underflow checks
 *    - More strict typing
 *    - Better error handling
 *
 * 2. Storage considerations:
 *    - The 'data' variable uses a dynamic string which can grow/shrink
 *    - Each storage operation costs gas based on string length
 *
 * 3. Gas optimization notes:
 *    - Uses 'calldata' for input string to save gas
 *    - Combines storage and event emission in one operation
 *    - String storage is relatively expensive, especially for longer strings
 *
 * 4. Security considerations:
 *    - Function is payable but doesn't handle received ETH
 *    - No access controls on the test function
 *    - No string length limits enforced
 */

/// @title Tester Contract
/// @author Original code provided by user
/// @notice A simple contract that stores and emits string data
/// @dev This contract demonstrates basic string storage, events, and public functions
contract Tester {

    /// @notice Event emitted when the test function is called
    /// @param _data The string data that was stored and is being emitted
    /// @dev This event can be used to track all data updates in the contract
    event Tested(string _data);

    /// @notice Public variable to store string data
    /// @dev This variable is automatically given a getter function by Solidity
    /// @return The currently stored string data
    string public data;

    /// @notice Updates the stored data and emits an event
    /// @dev This function both stores the data and emits it in a single operation
    /// @param _data The string to store and emit
    /// @return void This function doesn't return any values
    /// @custom:note The function is payable but doesn't use the sent ETH
    /// @custom:example 
    /// ```solidity
    /// contract.test("Hello World");
    /// // Sets data to "Hello World" and emits Tested("Hello World")
    /// ```
    function test(string calldata _data) public payable {
        // Store the input data and emit it in a single operation
        // The assignment happens first, then the result is passed to the event
        emit Tested(data = _data);
    }
}
