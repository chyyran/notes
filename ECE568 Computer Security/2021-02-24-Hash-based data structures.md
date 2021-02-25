# 2021-02-24 Hash-based data structures

* allows us to efficiently verify integrity of a set of things
* If we concatenate all strings over a set naively and hash that is expensive
* Hash tree
  * data integrity
  * allows for easy update
* Blockchain
  * Journal of events with integrity and authentication
* Merkle trees
  * data blocks are hashed 
  * n hashes are hashed to create parent hash
  * n parent hashes are hashed to create another parent hash node
  * log_n K (for n dependents, usually 2) calculations for one change change in a data set of size K
    * just walk up the tree
  * blockchain is just merkle tree by using previous blocks in a ledger in transaction
    * timestamp
    * previous block hash
    * hash of tree
    * transactions
    * nonce
    * signature
  * 