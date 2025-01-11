// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentWithMessage {
    // Event to log payments with message hashes
    event PaymentSent(
        address indexed sender,
        address indexed receiver,
        uint256 amount,
        bytes32 messageHash
    );

    /**
     * @dev Sends Ether along with a message.
     * The message is hashed for privacy and gas efficiency.
     * @param receiver The address of the payment receiver.
     * @param message The plaintext message to include with the payment.
     */
    function sendPayment(address payable receiver, string memory message) public payable {
        require(msg.value > 0, "Payment amount must be greater than zero");

        // Hash the message using keccak256
        bytes32 messageHash = keccak256(abi.encodePacked(message));

        // Transfer the Ether to the receiver
        receiver.transfer(msg.value);

        // Emit the event with the message hash
        emit PaymentSent(msg.sender, receiver, msg.value, messageHash);
    }

    /**
     * @dev Utility function to hash a message with a secret key.
     * This can be used for off-chain encryption.
     * @param message The plaintext message to encrypt.
     * @param secretKey A secret key for hashing.
     * @return The encrypted message hash.
     */
    function encryptMessage(string memory message, string memory secretKey) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(message, secretKey));
    }

    /**
     * @dev Verifies if an encrypted message matches the original message and secret key.
     * @param message The original plaintext message.
     * @param secretKey The secret key used for encryption.
     * @param encryptedMessage The hash of the encrypted message.
     * @return True if the encrypted message matches; false otherwise.
     */
    function verifyMessage(string memory message, string memory secretKey, bytes32 encryptedMessage) public pure returns (bool) {
        return keccak256(abi.encodePacked(message, secretKey)) == encryptedMessage;
    }
}

