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

event CredentialIssued(
    uint256 indexed credentialId,
    address indexed student,
    address indexed issuer
);

function issueCredential(
    address _student,
    string memory _program,
    bytes32 _credentialHash
) public {
    require(authorizedIssuers[msg.sender], "Not an authorized issuer");

    credentialCount++;

    credentials[credentialCount] = Credential({
        student: _student,
        program: _program,
        issuer: msg.sender,
        issuedAt: block.timestamp,
        credentialHash: _credentialHash,
        revoked: false
    });

    emit CredentialIssued(credentialCount,
_student, msg.sender);
    }

    function verifyCredential(uint256 
_credentialId)
    public
    view
    returns (
        address student,
        string memory program,
        address issuer,
        uint256 issuedAt,
        bytes32 credentialHash,
        bool revoked
    )
{
    Credential memory credential = credentials[_credentialId];

    return (
        credential.student,
        credential.program,
        credential.issuer,
        credential.issuedAt,
        credential.credentialHash,
        credential.revoked
      );
 
    }
} 

