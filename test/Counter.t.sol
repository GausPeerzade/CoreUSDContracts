// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/CoreLogic.sol";
import "../src/CoreUSD.sol";
import "../src/Oracle.sol";

contract CounterTest is Test {
    address public protocol;
    address public coreUsd;
    address public oracle;

    function setUp() public {
        Oracle _oracle = new Oracle();
        console.log("oracle address is", address(_oracle));
        oracle = address(_oracle);
        Oracle(oracle).setPrice(103e16);
        console.log("oracle price is ", Oracle(oracle).getPrice());

        StableToken _coreUsd = new StableToken();
    }

    function testSetUp() public {}
}
