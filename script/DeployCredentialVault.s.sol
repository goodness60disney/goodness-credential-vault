// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {CredentialVault} from "../src/CredentialVault.sol";

contract DeployCredentialVault is Script {
    function run() external returns (CredentialVault) {
        vm.startBroadcast();

        CredentialVault credentialVault = new CredentialVault();

        vm.stopBroadcast();

        return credentialVault;
    }
}
