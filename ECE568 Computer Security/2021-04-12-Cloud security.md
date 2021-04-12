# 2021-04-12 Cloud security

* What is cloud computing
  * SaaS
    * full software stack
    * Salesforce, Wordpress
  * PaaS
    * language/layers/DB
    * AWS, App Engine
  * IaaS
    * VM
    * EC2, Compute engine, digital ocean
* IaaS starts with hardware
  * want to ensure that the VM is secure
  * hypervisor security has to be solid (can we sploit this?)
  * block/object storage might be separate from VM
* best practices
  * rapidly evolving
  * still defining 'best practice'
  * server is running 'right next' to strangers' machines
  * overcome security challenge of shared infrastructure
* trust in cloud environments
  * cloud service provider (CSP) 
  * clients trust CSP to provide confidentiality, integrity, availability
  * CSP trust clients not to behave badly
  * CSP needs to protect good clients from malicious clients
* confidentiality
  * usage statistics
  * customer software, data
  * threats:
    * access patterns (VM/storage)
    * side channel leakage (retrieving data from stale VMs)
* integrity
  * customer software, data
  * threats:
    * race conditions
    * data consistency
    * block/object storage manipulation
      * trust CSP to provide integrity of data
      * government censorship/oversight
    * VM image integrity
* Availability
  * uptime of hypervisor
  * client data durability
  * geolocation
    * legal jurisdictions
    * GDPR
  * OVH fire
  * threats:
    * attacks on hypervisor, storage layer
* hypervisors
  * allows servers to be partitioned into VMs
  * low level software component
  * trusted to isolate VM from one another
    * security
    * performance
  * how can CSP detect compromised hypervisor
    * TPM (trusted platform module)
      * secure co-processor on motherboard
      * TPM signs a hash of software running at boot (attestation)
      * can make available to client or CSP to verify integrity of running code
  * need to trust hypervisor before building higher levels of trust
* firewalls
  * customer-controlled to restrict ingress/egress
  * firewalls run on separate servers
    * compromised VMs don't affect firewalls
    * similar to physically separate firewalls in traditional on-site configs
* crytogrpahy
  * transit
    * SSL/TLS
    * CSPs have certs from well known CAs
  * rest
    * amazon: object storage encrypted and signed, block storage is plaintext
    * openstack: block storage encrypted and signed, object storage plaintext
    * Joyent: no encryption, CSPs shouldn't be trusted and customers should use their own encryption
    * no best prctice
* networking
  * customers VM run customer code
  * IP addresses belong to CSP
  * malicious traffic can cause CSP IP to be banned
  * security runs in reverse here
  * IPs may be rotated round CSP
  * defenses:
    * monitor for spoofed packets
    * blocking outbound services like spam
* interaction of proprietary CSP interests and customer interests
* Information leakage
  * channels
    * shared caches
    * storage channels
    * covert channels
      * processor bugs that will leak VM details
      * cache timing exploit
        * run code on same processor as victim
        * use shared cache as timing channel to infer information about victim data
        * attack consists of alternating 'prime' and 'probe' phases
          * prime:
            * attacker fills shared cache with data, evicting victim data
            * lets victim execute code which uses shared cache
            * loads by victim will cause attackers data to be evicted from cache
          * probe:
            * attacker reads data from cache and times how long each read takes
            * some access will take longer (cache miss)
            * attacker can infer which cache lines the victim accessed
            * channel leaks enough info to allow attacker to recover victim AES key (bernstein 2005)
        * branch predictors 
        * defenses
          * allocate memory so there is no overlapping cache lines
            * really restrictive
            * not feasible
          * allocate memory so cache lines that have sensitive info can not be evicted
            * does not affect timing of attacker memory accesses
            * 'Pin' unevictable cache
    * covert channels
      * attacker trying to compromise VM
      * experiements achieved 2-10bits per second on cache-based covert channels
      * memory bus on EC2 achieved 100 bits per second
* Data security
  * goal: provide with high probability a CSP has maintained integrity, available, durability of customer data
  * soln: probablistic algo, where customers construct queries on their data
    * if queries answered correctly by CSP, provides high probability that I/A/D of data has been maintained
  * proof of retrieval
    * similar to stack canaries
    * customer encrypts file and randomly embeds set of randomlly valued check blocks (sentinels)
    * customer challenge cSP by asking for random collection of sentinel blocks
    * if CSP modified or deleted substaintial portion, sentinels will not check with high probability
    * checksums used to detect small changes
  * provable data posession
    * homomorphic encryption (similar to RSA)
      * multiplying encrypted value by constant is the same as doing the operation on plaintext
    * client precomputes tag for each block of file and stores file
    * tags are computed homomorphically
      * tags computed for multiple blocks can be combined into a single value
      * CSP should be able to return some tags without access to plaintext
    * similar to digital signature
* not in the commercial interest of CSPs to disclose weaknesses
  * how can academic research interact with industrial IaaS deployments?
  * academia identifies threats, and industry reacts to provide solns
  * no tangible transfer of academic solns to industry deploys