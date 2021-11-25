# 2021-11-17 Improving scientific simulations

* Tricks to improve scientific simulation performance
* Practices
  * Tune surface to volume ratio
  * Use ghost zones when necessary
  * Approximate interactions if possible
  * Compress data
* Tune surface to volume ratio
  * Stencil computation on a mesh
  * Computations that happen on a structured grid
  * Each circle is a mesh point  and each cell in the mesh needs values to update mesh
  * For example, pixels in image
  * Which partitioning has less communication?
    * row based
      * in this scenario, there are 3 cuts and there will be n edges = 3n edge cuts
      * n*(processors - 1) edge crossings
    * 2x2 squares?
      * 1 cut of n edges, and another cut of n edges = 2n edge cuts
      * 2*n*(p^{1/2} -1)
    * Edge crossing will require process/process communication
    * Volume defined as the amount of computation happening per partition
    * surface is defined as average edge crossing per partition
      * which scenario below has lower surface to volume ratio
      * also the 2x2 squares
      * we want to maximize volume of computation wrt surface = low surface to volume ratio
* Ghost zones
  * Consider a huge mesh that is separated between processors
  * replicate what you need from other machine locally in your own memory so you don't have to communicaate
  * copy a  halo around the partition so when we're doing compute, we have everything we need
    * no need to stall for halo to be communicated
  * we have more local elements as a result of the ghost zone
  * what are the drawbacks of ghosting?
    * memory is a problem, especially on the GPU
    * we will automatically increase surface to volume ratio
    * we have to update ghost elements for them to be usable in the current processor - redundant computation
      * can not constantly ask machine to do extra FLOPS to hide communication
    * the size of ghost region depends on numerous things
* approximating interactions
  * large class of simulations in physics and machine learning
  * force depends on distance
  * often impossible or very expensive to compute all interactions
  * algorithm might not even be parallel
  * checking every pair for collision is O(n^2)
  * recursively partitioning
    * for the particles that are denser are further divided
    * this allows us to only calculate interactions of particles in a local neighbourhood
  * approximating interactions comes at the cost of a less accurate solution!
* compress
  * only store the non-zeroes and use less memories in sparse matrix
  * matrix might initially look dense
  * might be the case that the problem is hierarchal (n-body)
  * as a result, you can approximate some of the values to become 0 
  * convert dense matrix into sparse matrix!
  * can compress huge matrix into smaller arrays
  * sparse = around 1% or less of the matrix is not zero (scientific computing)
  * sparse = 5-10% non-zero (machine learning)
  * example
    * could have assembled a matrix and done matrix vector multiplication that would result in same solution 
    * use algebraic form to represent matrix
    * non-zeroes are very neatly arranged = block structure sparse matrices
    * sparse matrix can be compressed in many ways
      * compressed sparse row
      * val vector stores all non-zero value sin matrix
      * ind vector stores column index of non-zero values
      * ptr vector points to beginning of each row in val and
      * 