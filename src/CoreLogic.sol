// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract CoreLogic is Ownable {
    address public coreUSD;
    mapping(address => uint256) public collateralDeposited;
    mapping(address => uint256) public totalDebt;
    uint256 public liquidityThreashold;
    uint256 public minThreashold;
    address public oracle;

    error CollateralValueZero();

    constructor(
        address _coreUSD,
        uint256 _liquidityThreashold,
        uint256 _minThreashold,
        address _oracle
    ) Ownable(msg.sender) {
        coreUSD = _coreUSD;
        liquidityThreashold = _liquidityThreashold;
        minThreashold = _minThreashold;
        oracle = _oracle;
    }

    function deposiCollateral() external payable {
        if (msg.value == 0) {
            revert CollateralValueZero();
        }
        collateralDeposited[msg.sender] += msg.value;
    }

    function deposiCollateralandMint() external payable {}

    function borrowTokens() external {}

    function redeemCollateral() external {}

    function redeemCollateralandBurn() external {}

    function repay() external {}

    function swap() external {}

    function liquidate() external {}

    function userInfo() public view {}

    function config() public view {}

    function getHealthFactor() public view {}

    function coreToUSD() public view {}

    function usdToCore() public view {}
}
