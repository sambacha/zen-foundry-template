// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "../src/PhonyUser.sol";
import "./test_target.sol";

/// @title PhonyUserTest - Test Suite for PhonyUser Contract
contract PhonyUserTest is Test {
    PhonyUser public phonyUser;
    TestTarget public testTarget;

    function setUp() public {
        // Deploy contracts
        phonyUser = new PhonyUser();
        testTarget = new TestTarget();
    }

    /// @dev Test tryCall for successful execution
    function testTryCallSuccess() public {
        bytes memory data = abi.encodeWithSelector(TestTarget.successFunction.selector);
        (bool success, bytes memory returnData) = phonyUser.tryCall(address(testTarget), data);

        assertTrue(success, "Call should succeed");
        assertEq(abi.decode(returnData, (string)), "SUCCESS", "Return data mismatch");
    }

    /// @dev Test tryCall for failure with custom error
    function testTryCallFailureWithError() public {
        bytes memory data = abi.encodeWithSelector(TestTarget.errorFunction.selector);
        (bool success, bytes memory returnData) = phonyUser.tryCall(address(testTarget), data);

        assertFalse(success, "Call should fail");
        assertEq(abi.decode(returnData, (string)), "CUSTOM_ERROR", "Error message mismatch");
    }

    /// @dev Test tryCall for failure with empty revert
    function testTryCallFailureWithEmptyRevert() public {
        bytes memory data = abi.encodeWithSelector(TestTarget.emptyRevertFunction.selector);
        (bool success, bytes memory returnData) = phonyUser.tryCall(address(testTarget), data);

        assertFalse(success, "Call should fail");
        assertEq(returnData.length, 0, "Return data should be empty");
    }

    /// @dev Test call for successful execution
    function testCallSuccess() public {
        bytes memory data = abi.encodeWithSelector(TestTarget.successFunction.selector);
        bytes memory returnData = phonyUser.call(address(testTarget), data);

        assertEq(abi.decode(returnData, (string)), "SUCCESS", "Return data mismatch");
    }

    /// @dev Test call for failure with custom error
    function testCallFailureWithError() public {
        bytes memory data = abi.encodeWithSelector(TestTarget.errorFunction.selector);

        vm.expectRevert("CUSTOM_ERROR");
        phonyUser.call(address(testTarget), data);
    }

    /// @dev Test call for failure with empty revert
    function testCallFailureWithEmptyRevert() public {
        bytes memory data = abi.encodeWithSelector(TestTarget.emptyRevertFunction.selector);

        vm.expectRevert("REVERT_NULL_MESSAGE");
        phonyUser.call(address(testTarget), data);
    }
}
