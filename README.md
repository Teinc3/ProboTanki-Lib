## Cryption Vector Syncing
- To spoof outbound packets, encryption and decryption indices must match the originals, as the server can only decrypt packets with correct indices.
- A sniffer for inbound and middleware for outbound packets are needed. The sniffer decrypts inbound packets without interfering, while the middleware intercepts, decrypts, modifies and re-encrypts outbound packets to maintain encryption sync with the server.
- The middleware's decryption vector will be in sync with the client's encryption vector, and the middleware's encryption vector will be in sync with the server's decryption vector.

## Others
- I can decrypt inbound packets, but haven't figured out outbound decryption yet. Ideally, please help me figure it out, if you can.

- For a TCP proxy, check out https://github.com/ewpratten/tcprelay.s