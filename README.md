# Payment-with-Message-on-Blockchain

A blockchain-based decentralized application (dApp) that enables users to send Ether payments along with a message. The message is securely hashed using `keccak256`, ensuring privacy and reducing gas costs. This system is efficient, transparent, and easy to use.

---

## Features

1. **Send Payment with a Message**  
   - Users can send payments with an attached message.  
   - Messages are hashed to maintain privacy while providing a secure transaction log.

2. **Gas Efficiency**  
   - Avoids storing plaintext messages on-chain, significantly reducing gas fees.  
   - Uses event-based logging to optimize the transaction process.

3. **Privacy**  
   - Only the hash of the message is stored on-chain, ensuring that the original message remains confidential.

4. **Optional Message Encryption**  
   - Messages can be hashed with a secret key for added security before sending.

5. **Event Logging**  
   - Transaction details are logged for transparency and auditability.

---

## Benefits

### 1. Privacy  
- Plaintext messages are never stored on-chain, making it impossible for anyone to view the message directly.  
- Hashing ensures that even if the data is logged, it remains unreadable without the original message.

### 2. Gas Efficiency  
- Reduces on-chain storage requirements by only emitting message hashes in events.  
- More cost-effective compared to traditional message storage mechanisms.

### 3. Security  
- Allows optional message encryption using a secret key, further enhancing the security of sensitive data.

### 4. Transparency  
- Each transaction is logged with sender, receiver, amount, and hashed message details.  
- Provides an auditable record of all interactions.

---

## How It Works

1. A user calls the `sendPayment` function, providing:
   - Receiver’s address.
   - A plaintext message.
   - Payment amount in Ether.

2. The contract:
   - Hashes the message using `keccak256`.
   - Sends the Ether to the receiver.
   - Emits a `PaymentSent` event containing transaction details and the hashed message.

---

## Example Usage

### Sending a Payment with a Message
1. Call the `sendPayment` function:
   ```solidity
   sendPayment(receiverAddress, "Thank you for your service!") payable with 1 ETH;
