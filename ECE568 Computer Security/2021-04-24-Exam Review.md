# 2021-04-24 Exam Review
* SYN flooding
  * SYN is part of the TCP handshake
  * server allocates some resources
    * ports
    * memory
    * open connections
  * defenses
    * synack cookies
    * server synchronization number + hashes
* ARP poisoning
  * attacker + victim on same subnet
  * reply to every ARP request to map IP address to MAC
  * attacker claims that they have all the IP address
  * ARP packets are only sent around local networks
* SSL clients
  * Are clients authenticated in SSL?
  * Optional
  * certificate exchange
  * server can request cert from client
  * in HTTPS, requiring cert from client is weird
* covert channels
  * intentional channel created by an attacker that leaks information
  * hidden from normal views
  * signaling methods that are not intended for use
    * hard to be protected at unintentioned gateways
    * ACLs, etc, can't be enfoced
  * operate outside of the systems
* preimage resistance vs second preimage resistance
  * preimage resistance is resistance against reversing the hash (going from hash to original)
    * how resistant is the hash algorithm to reversing
  * second preimage resistance is the resistance against finding a collision
    * hash-to-hash
    * in theory, you could swap messages
    * birthday problem
* format string attack
  * `printf(buffer)` vs `printf("%s", buffer)`
    * the first call is executed, so is vulnerable to FSA
  * second call is vulnerable to stack smash
* Message signing
  * How is a signature generated in PKC?
    * Agree on algo with recipient
    * Encrypt hash of message with privkey
    * Attach fingerprint with message
    * recipient decrypts sig with pubkey, and compares hash
* What does the signature protect?
  * consider unencrypted webpage signed with a tag with name, date, and signature
  * the signature isn't useful, it isn't attached on the web page!
  * **signature needs to include some reference to the content that is signed**
* BGP exploits
  * accidentally exploited by pakistan
  * like ARP but on a bigger network
  * controls routing between autonomous networks on the internet
  * if someone launched a BGP attack, they can redirect traffic to a different server
  * BGP is unauthenticated
  * if ISP receive BGP update, they will do rerouting
* virus vs worm?
  * propagation method: virus requires some help, worms are self propagating
  * viruses infect host programs or documents
* kerberos
  * auth server vs ticket-granting server
  * separation between autheticating users with service access (authorization)
  * authorization trusts authentication layer
  * service trusts authorization layer
  * service just needs to recognize validity of service ticket
* worm 
  * whats a hitlist?
    * a list of known-vulnerable systems that can be used to boostrap the rapid spread of worms
* rootkit
  * explain a technique that rootkit might use to prevent files from showing up
  * a rootkit can hook into the kernel trap points or syslib (libc for example) and takeover calls, allowing it to filter itself from calls like `opendir`, MITMing the system calls