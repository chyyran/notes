# 2021-02-24 Tesla Buffer Overflow

* Overflow in ConnMan (Connection Manager)
  * lightweight network manager in embedded systems
  * network manager is the OS component responsible for configuring, maintaining network connections
    * ethernt, wifi, bluetooth
  * plugins that act as proxies that abstract away network protocols (DNS, NTP, etc)
* DNS response compression
  * FQDN encoded in divided labels
  * 8 bit integer len in front of a series of labels
  * `www.example.com` -> [(3)`www`, (7)`example`, (7)`com`, (0)] 
  * FQDN query may be repeated a bunch in a full DNS request
  * If a portion of a name is requested, we encode it as a field lengt of 192, followed by byte offset of the previous copy of the name
  * Repetitions can be encoded as 2 bytes
* CVE-2021-26675
  * DNS proxy in ConnMan allows a malicious DNS reply to uncompress into a large string that overflows 
  * ConnMann runs as root
  * Can remotely create a malicious DNS reply
  * Remote buffer overflow attacks are harder to accomplish because attacker doesn't have visibility into target stack
  * Second bug discovered in DHCP client in ConnMann where uninitialized structure stored on the stack can leak stack addresses to remote attacker
    * attacker needs to be same subnet
    * fix was 
      * ```diff
        - struct dhcp_patch packet; 
        + struct dhcp_patch packer = {0};
        ```
* implictions
  * high risk of consumer safety impact (target is a car!)
  * devices may not support easy/auto upgrades
  * unclear risk if attacker is not on same subnet
    * cars, mobile devices may share subnet with a lot of strangers
* 