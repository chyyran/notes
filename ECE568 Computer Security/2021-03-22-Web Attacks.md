# 2021-03-22 Web Attacks

* XSS- Cross site scripting
  * Type 1: Reflected
    * Attacker crafts URL targeting vulnerable site
    * User needs to clicks on URL for successful attack
    * **Website is not modified**
    * usually because of dynamic information in GET params
      * send unescaped JS in GET param to cause XSS
      * does not violate Same Origin Policy
        * script originates from same site as cookies
        * arbitrary JS can manipulate DOM
      * web server should have checked GET params are valid
        * poor input validation
      * similarities between XSS and buffer overflow?
  * Type 2: Persistent
    * Attacker posts arbitrary script on vuln site
    * User visits victim site
    * **Website is modified**
    * failed input validation allows script tags in user-generated input
    * picture could possibly trigger exploit from image decoding library
* Samy Worm
  * Users could post arbitrary HTML on myspace
  * Did not sanitize script in CSS tags
    * `<div style = 'background:url('javacript:alert(1)')>`
  * Some browsers allowed variations on script tags
  * Samy worm infected anyone who visited an infected page by adding Samy as a friend
* XSS defenses
  * better input filtering
  * check and remove scirpt from input
    * this is difficult to do
  * convert special characters into HTML escape codes
    * limitations?
  * whitelisting
    * allow small set of safe chracters
  * HTTP_only cookies
    * tag certain cookies as being inaccessible to JS
    * JS will not be able to read the cookie
* SQL injection
  * injects SQL into the db layer
  * unsanitized SQL params
  * taking input directly from user and building DB query string
  * if attacker sets user to `' or 1 = 1 --` then query always returns `True`
  * SQL allows shell escape: `union select load_file('/etc/passwd')`
  * If we get hashes, we can easily bruteforce them
    * MD5 is broken
  * Solution is validation, parameterized queries
* HTTP Response Splitting
  * allows splitting HTTP response header into spoofed header and body
  * response header and body are separated by CRLF
  * if header contains user input, then attacker might be able to split the header into valid header and body
  * similar to reflected XSS
* Cross-Site Request Forgery (CSRF)
  * allows unauthorized commands from user to the website
  * attacker tricks user into visiting website that a user may have previously visited
  * if user's browser contains valid auth cookie, attacker can issue authenticated request using user's cookie
  * same-origin applies to cookies not links
  * CSRF exploits trust a website has for a browser
    * site can not distinguish between legit requests and unintended requests
  * **defenses**
    * auth cookie timeouts
    * checking HTTP referer
      * can be faked
    * secret token information in GET and POST
      * needs to pass along form every time
      * every link would have to come live
    * requiring auth info in GET and POST, not just in cookies

