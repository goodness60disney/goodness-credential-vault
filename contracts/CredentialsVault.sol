//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract CredentialVault { 

struct Credential {
     address student;
     string program;
     address issuer;
     uint256 issuedAt;
     bytes32 credentialHash;
     bool revoked;
    }
} 
