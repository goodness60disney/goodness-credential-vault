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
    mapping(uint256 => Credential) public 
credentials; 

    uint256 public credentialCount;

    address public owner;

    constructor()  {
          owner = msg.sender;
    }

    modifier onlyOwner() {
          require(msg.sender == owner, "Not the 
contract owner");
          _;
    mapping(address => bool) public authorizedIssuers;
function addIssuer(address _issuer) public onlyOwner {
    authorizedIssuers[_issuer] = true;
    }
} 
