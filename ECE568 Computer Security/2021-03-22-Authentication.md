# 2021-03-22 Authentication

* web cookie auth
  * user auth'd through user/pass, cookie saved
  * cookie serves as proof of identity
* user should use diff user/pass for each website
  * each website needs to implement
  * user auth
  * new user reg
  * pass recovery
  * credentials stored all over the place
* federated identity
  * designate central identity provider
  * single service maintains users' user/pas
  * multiple services rely on identity provider to authenticate users that interact with service
* kerberos
  * network wide auth service using needham-schroeder
  * divides function into three buckets
    * authentication server
    * ticket granting server
    * service
  * say client wants to access service S
    * client asks auth server to estabish ident
      * user/pass
      * duo
      * whatever
    * auth server hands back Ticket Granting Ticket
      * TGT is proof of identity
    * client sends TGT to ticket granting server
      * TGS does authorization
      * TGS sends back authorized ticket after validating TGT
      * does not need to know method of authentication
    * service only recognizes that the ticket is valid
* SSO vs Federated Identity
  * SSO is what
  * Federated identity is how
  * often tied together
  * only SSO
    * no outsourced identity
      * Amazon, ECF
    * non-federated, SSO-only systems becoming rarer
  * Only federated identity
    * central auth service, but requires re-auth new service
    * shares identity but not authorization
* SSO flow
  * user auths to the identity provider
  * server provides token containing user identity
  * user presents token to service
  * service accepts token as proof of identity
    * token must be unforgeable
    * token must not be leaked
* OAuth
  * open spec
  * used by FB, Google
  * OAuth is an authorization protocol
  * OAuth supports several authorization codes
    * commonly is Authorization Code Grant
    * three parties
      * resource owner: user
      * auth server/idP
      * client: website trying to get auth
  * Flow
    * Website redirects user to auth server with OAuth client ID and redirect URI
    * auth server authenticates user and returns to user auth code
    * user goes to redirect URI with auth code
    * website talks to auth server with client secret and auth code
    * auth server sends access token
    * access token + request sent back to auth server
    * auth server returns requested info
* Auth
  * Authentication is proving identity of user
  * Authorization is whether or not the user is allowed to do
