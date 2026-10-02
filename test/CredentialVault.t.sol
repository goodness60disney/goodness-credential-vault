// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {CredentialVault} from "../src/CredentialVault.sol";

contract CredentialVaultTest is Test {
    CredentialVault vault;

    address issuer = address(1);

    function setUp() public {
        vault = new CredentialVault();
    }

    function test_AddIssuer() public {
        vault.addIssuer(issuer);

        assertTrue(vault.authorizedIssuers(issuer));
    }
}
