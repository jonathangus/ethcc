// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import {UnswoshNFT} from "src/UnswoshNFT.sol";

contract DeployUnswosh is Script {
    UnswoshNFT public unswoshNFT;

    address public constant ERC6551_REGISTRY = 0x02101dfB77FDE026414827Fdc604ddAF224F0921;
    address public constant ERC6551_ACCOUNT = 0x2D25602551487C3f3354dD80D76D54383A243358;

    address public constant LENS_PROFILE_CREATION_PROXY = 0x420f0257D43145bb002E69B14FF2Eb9630Fc4736;
    address public constant LENS_HUB = 0x60Ae865ee4C725cd04353b5AAb364553f56ceF82;

    function run() external {
        // Account to deploy from
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);

        // Deploy Implementation Contracts
        unswoshNFT = new UnswoshNFT(
            ERC6551_REGISTRY,
            ERC6551_ACCOUNT,
            LENS_PROFILE_CREATION_PROXY,
            LENS_HUB
        );

        vm.stopBroadcast();
    }
}
