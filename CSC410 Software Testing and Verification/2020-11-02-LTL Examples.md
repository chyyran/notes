# 2020-11-02 LTL Examples

* Mutual Exclusion
  * We have 2 processes, `crit1`, and `crit2`.
  * We want to ensure the principle of mutual exclusion to a single resource
    * `crit1` and `crit2` can not hold the resource at the same time.
    * **always the case such that** either `crit1` has the resource, or `crit2` has the resource, or neither.
  * \(\square (\text{crit}_1 \cup \text{crit}_2)\)?
    * If on a path, every step we have \(\{a, b\}\), this trivially satisfies this formula, but this is not want we care about
  *  \(\square (\neg (\text{crit}_1 \wedge \text{crit}_2))\)?
     *  This is the correct answer
     *  This allows either `crit1`, `crit2`, or neither.
     *  `crit1` and `crit2` will never be able to hold the resource at the same time
  * \(\square (\text{crit}_1 \oplus \text{crit}_2)\)?
    *  This is too restrictive
    *  This forces either `crit1` or `crit2` to be in the critical section at any given time.
* Traffic light
  * Once red, the light can not become immediately green
  * We can separate concerns, assuming that only one light can be active at the same time.
  * \(\square (\text{red} \cup \text{yellow})\)?
    * Always you must be either red or yellow
    * Can never be green!
    * This is too restrictive
  * \(\square ((\text{red} \cup \text{yellow}) \vee \text{green}) \)
    * Not exactly
    * This is correct, if we assume that only one light can be active at the same time.
    * If we do not have that assumption, then the light can simultaneously be on, it is not as clean because it requires the big messy assumtion that only one light can be active at the same time.
  * \(\square (\neg (\text{red} \wedge \bigcirc \text{green})) \equiv \square(\text{red} \implies \neg \bigcirc \text{green})\)
    * This is the correct answer
    * Whenever it is red, the next step will not be green!
    * It does not force us to be red.
    * Does not allow us to transition from red to green.
* Every request will eventually lead to a response
  * Does not have to respond sequentially,
    * `req, res, ...`
    * `req1, req2, res2, res1, ...`
  * \(\square(\text{req} \implies \Diamond \text{res})\)
    * If there is a request, then eventually there must be a response
    * If there is no request, there is no obligation
    * No interaction between individual response/request pairs
* Once red, the light always becomes green eventually after being yellow for some time
  * We need to split up the question in order to solve this
  * Start with \(\square(\text{red} \implies \neg \bigcirc \text{green})\)
  * \(\square(\text{red} \implies (\Diamond (\bigcirc \text{yellow}) \cup  \bigcirc \text{green})))\)?
    * this is too restrictive
    * `red -> ...... -> yellow`
    * the `...` becomes arbitrary, and enforces no restriction
  * \(\square (\text{red} \implies (\text{red} \cup \text{yellow}) \cup \text{green})\)?
    * This is not correct (why?)
  * \(\square(\text{red} \implies (\text{yellow} \cup \text{green}))\)?
    * This is too permissive, we need at least one yellow
  * \(\square(\text{red} \implies \text{red} \cup  \bigcirc (\text{yellow} \wedge \bigcirc (\text{yellow} \cup \text{green})))\)?
    * This is the correct answer
    *  Derive from just the point where we are yellow for some time
       * \(\text{yellow} \wedge \bigcirc (\text{yellow} \cup \text{green})\)
         * Once we have at least one yellow, we will eventually see green
   * \(\square(\text{red} \implies \text{red} \cup   (\text{yellow} \wedge \bigcirc (\text{yellow} \cup \text{green})))\)?
      * Not as good as the above formula with the next
      * Correct **only if** we assume only one colour can be active at the same time.
      * Requires big messy assumption, because only one colour can happen at a time, \((\text{yellow} \wedge \bigcirc (\text{yellow} \cup \text{green}))\) is **known to be false**.
