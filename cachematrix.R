## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  cache <- NULL #no cache yet so, set cache to null
  
  #store into a  new matrix 
  setMatrix <- function() {
    x <<- newValue
    # assign new value to the matrix, flush the cache
    cache <<- NULL
  }
  #return the matrix just stored
  getMatrix <- function() {
    x
  }
 #cache the argument given
   cacheInverse <- function(solve) {
    cache <<- solve
   }
 # get the cached value
   getInverse <- function() {
     cache
   } 
#returning the list setting each element to a function  
 list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## The cacheSolve function returns the inverse of the special matrix created by the makeCacheMatrix function above.

cacheSolve <- function(y, ...) {
        ## Return a matrix that is the inverse of 'y'
  # get cached value
  inverse <- y$getInverse()
  # Return cached data if it exists
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  # else get the matrix, store the inverse in the cache after calculating it 
  
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  # return the inverse
  inverse
}
