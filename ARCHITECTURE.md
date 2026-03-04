# 🏗 AutoShield Vault Architecture

## System Overview

AutoShield Vault integrates on-chain smart contracts with off-chain validation using Chainlink Functions and CRE (Chainlink Runtime Environment).

---

## High-Level Workflow

User
  ↓
WalletRecovery.sol (Smart Contract)
  ↓
Chainlink Request Trigger
  ↓
CRE Workflow
  ↓
Chainlink Functions (Off-chain JS)
  ↓
External Address Intelligence API
  ↓
Validated Response Returned On-Chain
  ↓
Recovery Logic Executed

---

## Components

### 1️⃣ Smart Contract (Solidity)
- Handles wallet ownership logic
- Emits recovery requests
- Receives validated responses

### 2️⃣ Chainlink Functions
- Executes off-chain JavaScript
- Fetches external API data
- Returns verification result securely

### 3️⃣ CRE Workflow
- Connects blockchain trigger to off-chain execution
- Ensures secure message passing

### 4️⃣ External APIs
- Used to classify wallet addresses
- Provide real-world intelligence

---

## Security Model

- No direct centralized API calls from contract
- All off-chain data processed via Chainlink infrastructure
- Trust-minimized verification

---

## Vision

A hybrid smart contract system enabling autonomous, verifiable wallet recovery without centralized control.