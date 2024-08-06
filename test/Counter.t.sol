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
        oracle = address(_oracle);
        Oracle(oracle).setPrice(103e16);

        StableToken _coreUsd = new StableToken();
        coreUsd = address(_coreUsd);

        CoreLogic _coreLogic = new CoreLogic(coreUsd, 130, 1, oracle);
        protocol = address(_coreLogic);
        StableToken(coreUsd).transferOwnership(protocol);
    }

    function testSetUp() public {
        console.log("oracle address is", oracle);
        console.log("oracle price is ", Oracle(oracle).getPrice());
        console.log("coreUsd address is", coreUsd);
        console.log("protocol address is", protocol);
    }

    function testDeposit() public {
        CoreLogic(protocol).deposiCollateral{value: 1e18}();
        uint256 deposited = CoreLogic(protocol).collateralDeposited(
            address(this)
        );
        uint256 tokenMinted = CoreLogic(protocol).totalDebt(address(this));
        uint256 hf = CoreLogic(protocol).getHealthFactor(address(this));
        console.log("deposit is ", deposited);
        console.log("tokenMinted is ", tokenMinted);
        console.log("hf is ", hf);
    }

    function testDepositAndMint() public {
        CoreLogic(protocol).deposiCollateralandMint{value: 10e18}(9e18);
        uint256 deposited = CoreLogic(protocol).collateralDeposited(
            address(this)
        );
        uint256 tokenMinted = CoreLogic(protocol).totalDebt(address(this));
        uint256 hf = CoreLogic(protocol).getHealthFactor(address(this));
        console.log("deposit is ", deposited);
        console.log("tokenMinted is ", tokenMinted);
        console.log("hf is ", hf);
    }
}
