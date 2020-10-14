# 2020-09-28 Hoare Logic

* Hoare Logic used to prove programs correct by Tony Hoare in the 60s
* How do we deal with proving large programs?
  * Modularity! We can prove smaller parts of the program individually then combine the small proof into one big proof.
* Hoare Triple
  * \(\{p\} S \{q\}\)
  * \(S\) is a program, and \(p\) and \(q\) are pre and post conditions.
  * A Hoare triple is valid if given \(p\), \(q\) holds after the execution of \(S\)
* Axioms and Rules
  * **Skip Axiom:** \(\{p\} skip \{p\}\)
    * This is a no-op. When we execute nothing, any precondition \(p\) that held before still holds.
  * **Assignment Axiom:** \(\{p[u := t]\} u:= t \{p\}\)
    * Captures the effect of an assignment statement. 
    * If we replace every variable \(u\) in the predicate \(p\) with the value \(t\) before running the program (and \(p\) still holds!), then \(p\) still holds after the assignment.
    * Examples: 
      * \(\{1 > 0\} x := 1 \{x > 0\}\) 
      * \(\{y > 0\} x := y \{x > 0\}\) To assign \(x := y\) and have the predicate remain true, we require \(y > 0\)
  * **Composition Rule:** \(\frac{\{p\} S_1 \{r\}, \{r\} S_2 \{q\}}{\{p\} S_1; S_2 \{q\}}\) 
    * If we have proofs \(\{p\} S_1 \{r\}\) and \(\{r\} S_2 \{q\}\), then we also have a proof \(\{p\} S_1; S_2 \{q\}\)that, given \(\{p\}\), after executing \(S_1\) an \(S_2\), that \(\{q\}\) is true.
  * **Conditional Rule:** \(\frac{\{p \wedge B\} S_1 \{q\}, \{p \wedge \neg B\} S_2 \{q\}}{\{p\} \text{ if } B \text{ then } S_1 \text{ else } S_2 \text{ fi } \{q\}}\)
    * If we have a proof of \(\{p\}\) given both \(B\) and \(\neg B\), then after running \(S_1\) or \(S_2\), we need to prove that \(\{q\}\) holds in both cases. If we have such a proof, then regardless of the condition, \(\{p\}\) after running either \(S_1\) or \(S_2\) will result in \(\{q\}\) holding.
  * **Loop Rule:** \(\frac{\{p \wedge B\} S \{p\}}{\{p\}\text{ while } B \text{ do } S \text{ od } \{p \wedge \neg B\}}\)
    * If we have a precondition \(p\) is true, and the loop condition \(B\), and a proof that \(\{p\}\) is maintained after running \(S\), then we have a proof that after a while loop runs, \(\{p\}\) still holds as well as the negation of the loop condition \(B\).
  * **Consequence Rule:** \(\frac{p \to p_1, \{p_1\} S \{q_1\}, q_1 \to q}{\{p\} S \{q\}}\)
    * If we want to prove \(p\) and \(q\), but we have a mismatched proof, we can use this to help.
    * If we have a **stronger condition** \(p\) that implies \(p_1\), and a **weaker condition** \(q\) that **is implied by** \(q_1\), but only have a proof \(\{p_1\} S \{q_1\}\), then we can simplify that to \(\{p\} S \{q\}\).
    * Can be combined with the loop rule to ease up strict loop conditions.
  * **Loop termination rule:**

    \[
        \frac{
            \{p \wedge B\} S \{p\},
            \{p \wedge B \wedge t = z\} S \{t < z\},
            p \to t \geq 0
        }
        {
            \{p\} \text{ while } B \text{ do } S \text{ od } \{p \wedge \neg B\}
        }
    \]
    * We want a proof of termination of the loop
    * \(t\) is the measure for termination. After executing \(S\), \(t\) decreases strictly. 