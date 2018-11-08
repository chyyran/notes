## Excercises Chapter 1

* 1.2
> Let \(S\) be a set of people, \(C\) be the set of all countries, and let \(T\) be a predicate defined over \(S \times C\) such that \(T(x,y)\) is True if and only if \(x \in S\) has travelled to country \(y \in C\). Express each of the following statements by a simple English sentence.

1.  \((\exists x \in S, T(x, \text{France})) \land (\forall y \in S, T(y,\text{Japan}))\)
Everyone in \(S\) has visited Japan, and at least one person that has France as well.

2. \(\forall x \in S, \exists y \in C, T(x, y)\)
Everyone in \(S\) has travelled to at least one country in \(C\).

3. \(\forall x, z \in S, \exists y \in C, T(x,y) \Longleftrightarrow T(z,y)\)
Everyone in \(S\) has a country for which another person in \(S\) has also travelled to.

* 1.3
> Write each of the statesments below in predicate logic, and then write the contrapositive and converse of each statement.

1. If all birds fly, and if Tweety is a bird, then Tweety flies.
\(\forall b \in \text{Birds}, Fly(b) \Longrightarrow (\text{Tweety} \in \text{Birds} \Longrightarrow Fly(\text{Tweety}))\)
**Contrapositive**
* \(\lnot(\text{Tweety} \in \text{Birds} \Longrightarrow Fly(\text{Tweety}))\Longrightarrow \lnot(\forall b \in \text{Birds}, Fly(b))\)
 * \(\text{Tweety} \in \text{Birds} \land \lnot Fly(\text{Tweety}) \Longrightarrow (\exists b \in \text{Birds}, \lnot Fly(b))\)
**Converse**
*  \((\text{Tweety} \in \text{Birds} \Longrightarrow Fly(\text{Tweety})) \Longrightarrow (\forall b \in \text{Birds}, Fly(b))\)

2. If it does not rain or it is not foggy, then the sailing race will be held and the registration will go on.
\(\lnot \text{Rain} \land \lnot \text{Foggy} \Longrightarrow \text{Sailing Race} \land \text{Registration}\)
**Contrapositive**
* \(\lnot(\text{Sailing Race} \land \text{Registration}) \Longrightarrow \lnot(\lnot \text{Rain} \land \lnot \text{Foggy)}\)
* \(\lnot\text{Sailing Race} \lor \lnot\text{Registration} \Longrightarrow \ \text{Rain} \lor \text{Foggy}\)
**Converse**
*  \(\text{Sailing Race} \land \text{Registration} \Longrightarrow \lnot \text{Rain} \land \lnot \text{Foggy}\)

3. If rye bread is for sale at Ace Bakery, then rye bread was baked that day.
\(\text{ForSale(Rye)} \Longrightarrow \text{BakedToday(Rye)}\)
**Contrapositive**
\(\lnot{\text{BakedToday(Rye)}  \Longrightarrow \lnot\text{ForSale(Rye)}}\)