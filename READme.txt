
# MyCustomToken Smart Contract

MyCustomToken is a custom ERC20 token built on the Ethereum blockchain. This contract includes functionalities for depositing, withdrawing, and changing the maximum transaction limit.

## Contract Details

- **Name**: My Custom Token
- **Symbol**: MCT
- **Max Transaction**: Maximum amount that can be withdrawn in a single transaction.
- **Owner**: The address of the contract owner (the one who deployed the contract).
- **Balances**: A mapping to track the balance of each address.

## Functions

### deposit

```solidity
function deposit(address _address, uint256 _number) public onlyOwner
```

Deposits a specified number of tokens to a given address. Only the contract owner can call this function.

- `_address`: The address to which tokens will be deposited.
- `_number`: The number of tokens to deposit. Must be greater than 0.

### withdraw

```solidity
function withdraw(address _address, uint256 _number) public
```

Withdraws a specified number of tokens from a given address.

- `_address`: The address from which tokens will be withdrawn.
- `_number`: The number of tokens to withdraw. Must not exceed the balance of the address and must not exceed the maximum transaction limit.

### changeMaxTransaction

```solidity
function changeMaxTransaction(uint256 _newMax) public onlyOwner
```

Changes the maximum transaction limit. Can only be called by the contract owner.

- `_newMax`: The new maximum transaction limit.

### owner

```solidity
function owner() public view returns (address)
```

Returns the address of the contract owner.

## Modifiers

### onlyOwner

Ensures that a function can only be called by the contract owner.

## Usage

1. **Deploy the Contract**: Deploy the contract to an Ethereum network using your preferred development environment (e.g., Remix, Truffle).
2. **Interact with the Contract**: Use the functions provided to deposit, withdraw tokens, and change the maximum transaction limit.
3. **Mint Initial Tokens**: The contract deployer is automatically minted 10 tokens initially.

## Error Handling

The contract uses `require()`, `assert()`, and `revert()` statements for error handling:

- `require()`: Checks for conditions that must be met. If not, the transaction is reverted with an error message.
- `revert()`: Reverts the transaction with a specific error message.
- `assert()`: Ensures certain conditions are true. Used to check for conditions that should never be false.

## Dependencies

This contract uses the OpenZeppelin ERC20 implementation. Make sure to install the OpenZeppelin contracts library:

```bash
npm install @openzeppelin/contracts
```

