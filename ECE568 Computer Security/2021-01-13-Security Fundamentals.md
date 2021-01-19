# 2021-01-13 Security Fundamentals

* ability to deliver
  * confidentiality
    * protection of data or resources from exposure
    * not just encryption
    * conceal **content of data or resource**
    * conceal **existence of data or resource**
      * just knowing that a resource exists may be damaging
      * metadata is valuable!
  * integrity
    * trustworthiness of the data or resource
    * correctness of the data contents, has it been altered?
    * correctness of the origin, can we authenticate data source?
  * availability
    * ability to access or use the data or resource as desired
    * resource is available if it is responding to requests
    * data is available if the service that stores the information is up and running
    * harder to ensure
    * uptime
    * attacks against availability (DoS)
    * system crashes
    * deal with availability probabilistic
  * CIA
    * deals with confidentiality, integrity, and availability to some degree
    * no system is completely secure
    * provide security for enough time for the data to be useful
  * Threats
    * any method that can be used to breach security and cause harm
    * when an attacker exercises a threat, it becomes an attack
    * if the attack is successful, the system is compromised
    * a vulnerability is a flaw that weakens the security of the system
      * very difficult to identify even after significant amounts of testing
      * uncheck string copy
      * debug flags enabled
      * default passwords
    * compromises occur when an attacker matches a threat with a vuln
      * leak
      * corruption
      * unavailability
    * Risk = P(thread) * P(vulns) * Cost(compromise)
    * need to look at the environment when considering threats
  * human factor
    * awareness, assurance
    * prone to making errors
    * usage errors
      * not everyone understands security
      * knowledgeable users created fewer vulns
      * keep in mind who created it, and who is going to use it
    * trade off between security and usability
    * quality of a security system measured by impacts to performance, usability
    * password requirements beat by people
      * everyone uses same password to bypass inane password policy, defeating the purpose of passwords in the first place
    * tailgating defeats passes
  * trust 
    * defines how much exposure a system has to an interface
    * the more a system trusts a component, the more likely the component will be a threat
    * good to not just assume trust
    * "reflections on trusting trust" -- thompson 1995
      * what if the compiler is compromised
      * what if someone examined the binary?    