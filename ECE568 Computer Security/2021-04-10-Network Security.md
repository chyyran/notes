# 2021-04-10 Network Security

* overview of protocols
  * ARP (address resolution protocol)
    * 'Who has an IP address?'
    * maps IP to MAC addresses
  * ICMP (internet control message protocol) 
    * used by IP layer to end error messages
      * desthost not available
      * TTL exceeded
  * TCP/IP for packet routing
  * BGP (border gateway protocol)
    * route discovery
  * DNS
    * maps domain names to IPs
* packet labelling is not authenticated
* packets has cksum but can be easily defeated
* common attacks
  * most protocols were designed with very little trust
  * SMTP is very insecure
    * no way to ensure integrity, anyone can fake an email addr
    * no confidentiality, emails are plaintext
    * no guarantee of availablity, if an email is dropped sender nor receiver will know
* ARP
  * IP layer uses IP addr for routing packets
  * maps IPs to MACs to IP addr can be sent to link layer
  * packets are sent to next hop using MAC (ethernet) addr
  * broadcasting
    * Host wants to send packet to IP A
    * Host performs ARP broadcast to ask which device owns A
    * All hosts except the host that owns A ignore, Host that owns A responds with MAC
    * Packets sent to A sent using the given MAC
    * gateway will respond to unknown IPs on another network
  * attacker can spoof ARP requests if they control host
    * attacker responds to all ARP broadcast to redirect traffic
    * ARP cache can be poisoned
      * attacker has to remember actual mappings to MITM
      * attacker spams network with ARP responses to corrupt cache
      * attacker now owns gateway + dest, can MITM
  * Mitigations
    * some systems can try to correlate ARP broadcasts on network
    * try to bookkeep and catch liars
    * rarely something that people deploy
  * anything not in HTTPS can be easily compromised
* ICMP Smurf attack
  * generates lots of traffic by flooding victim with ICMP from many machines
  * attacker sends ping stream with spoofed source of victim machine
  * every host will generate ping replies to victim
  * ping to broadcast will cause every machine to respond
* TCP handshake
  * Server is listening
  * Client sends SYN with ISN (initial sequence number)
  * Server sends SYN(ISN_C), and ACK with it's ISN (ISN_S), stores client IP 
  * Client sends ACK(ISN_S)
  * TCP can start flowing now 
    * three-way handshake: SYN, SYNACK, ACK
  * Sequence numbers are weak authenticator
    * attacker can forge packet with source IP set to client addr
    * forge source IP doesn't allow attacker to receive packets
    * if sequence number can be guessed, attacker can connect to server as victim client
    * older systems use sequential SNs so easy to guess
  * Connection spoof attack
    * attacker sends SYN with client IP
    * server sends client SYNACK
    * attacker guesses ISN_S and sends ACK
    * attacker is always deaf to responses, server always sends responses to clients
  * Reset attack
    * terminates established TCP connection to cause DOS
    * attacker spoofs sender's connecton and sends RST to receiver
      * needs IP spoof and guessing current SN
    * receiver will terminate connection on RST recv
  * SYN flood
    * attacker sends many connection request with spoofed IP source addr
    * victim allocates resources for each req until some timeout
    * OS have bound on these half-open sockets
    * attacker asks same server with a lot of SYN
    * server will SYNACK with random client
    * server is kill
    * defenses
      * drop half-open socket randomly
      * SYN-ACK cookies
      * client sends SYN
      * server responds client with SYN-ACK cookie
        * breaks TCP technically
        * ISN_S = H(srcadr, src port, dest addr, dest port, rand)
        * server does not save any state, does not open socket
      * honest client responds with ACK(ISN_S)
      * server regenerates ISN_s and checks client respond matches hashed ISN_S
    * low power firewalls look at SYN port to block incoming connections
      * if attacker knows SYN-ACK cookie key, attacker can 'establish' handshake by sending third ACK, bypassing firewall
      * remember no state is saved
      * TCP is broken
* BGP
  * internet broken up into autonomous systems (AS) managed via gateways
  * gateway routers communicate using BGP to update routing
  * if router goes down, BGP updates p2p with alternate routes to destinations
  * no authentication
  * attackers can compromise the protocol by advertising good routes to dests
  * traffic gets directed to attacker's gateway
  * similar to ARP attack
  * assumed that BGP routers are configured correctly and not malicious
  * sometimes done by state actors
* DNS
  * hierarchical naming system to map names to IP
  * caches can look up root/TLD, etc
  * maps using authoritative name servers
  * each domain has a NS responsible for DNS mappings
  * hierarchy makes DNS distributed
    * avoids needs for central registrar
  * client performs a DNS lookup (query) to a local DNS resolver
    * resolver queries TLD
    * name server replies with info about NS one level down the hierarchy
    * recursively resolves until IP addr is returned
    * query has query ID as basic security measure
* DNS cache poisoning
  * resolvers cache DNS mappings
  * name severs are trusted
  * attacker can update cache with bogus mappings
  * vuln
    * BIND buffer overflow
    * DNS spoofing for single host/domain
* DNS Spoofing Attack
  * try to poison victim NS with spoofed A
    * attacker requests for 'www.bankofsteve.com'
    * attacker sends several spoofed IP addrs with guessed query ID
    * spoof resp has correct ID, victim NS will save poisoned cache entry
      * race condition poisoning attack
    * need NS with poor randomization for query IDs
    * victim domain must be HTTP (otherwise HTTPS handshake will fail)
    * short TTL
  * try to poison nameserver NS with spoofed NS record
    * perform several requests for wwwN.bankofsteve.com (N is some random number)
    * attacker sends spoofed NS record responses
    * **correct cached NS will be evicted**
    * if attacker succeeds, they control entire domain for bankofsteve.com
* DNS can be used to tunnel packet traffic
  * uses rdata to transmit TCP packets
* DNS rebinding attack
  * replace mapping for victim domain with attacker IP
  * attacker sits outside firewall
  * attacker gets victim to visit some website 'attacker.com'
  * victim askes attacker NS for A, responds with short TTL
  * attacker webpage runs script that makes requests to attacker.com
  * attacker.com A record is invalidated because of low TTL
  * new A record points to IP inside firewall with low TTL
  * attacker script grabs data from inside-firewall IP
  * attacker script sends data, but because of low TTL re-retrieves A record
  * doesn't violate same origin becaue of same name
  * hard to distinguish between IP addr switch due to load balancing
  * defenses
    * browsers can pin DNS/IP mapping (ignore short TTL)
    * block resolution of external names into local IP address
* DDOS
  * attacker builds large number of compromised hosts to attack a single target (botnet)
  * multiple handlers that coordinate botnet 'agents'
* Common defenses to network security
  * cryptographic protocols
    * app layer: SSL/SSH
    * transport: crytographically random TCP/IP ISN
    * network layer: IPSec
* IPSec
  * confidentiality, integrity, source authentication, replay defense at IP layer
  * often used for VPN
  * 2 protocols
    * Authenticated headers (AH)
      * everything except confidentiality
      * protects IP packet except header fields 
      * uses MAC stored in AH header (after IP header)
    * Encapsulating Security Payload (ESP)
      * IP payload is encrypted to protect contents
  * Modes
    * transport mode
      * both endpoints support IPSec, intermediary routers do not
      * encrypts/authenticates payload
      * similar to SSH/SSL
    * tunnel
      * endpoints do not support IPSec but gateways do
      * encrypts/authenticates **header and payload**, and encapsulates in a regular plaintext packet
      * similar to SSH tunneling
  * If specific service supports SSL, SSL is better
  * If entire network is required, IPSec is better
  * IPSec has lower overhead since users an use same secure channel
  * SSL more compatible with firewalls
  * IPSec has poorly standardized implementions
  * IPSec supports pre-shared keys
  * don't use free VPNs
* 