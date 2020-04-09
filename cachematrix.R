## We have two functions coded below in order to study lexical scoping in R.
## 1) makeCacheMatrix & 2) cacheSolve
## The first function creates a special matrix. This function contains 
## commands for 1) setting the matrix
##              2) getting the matrix
##              3) setting the inverse of the matrix
##              4) getting the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

}

## The next function calculates the inverse of the matrix we create using 
## 'makeCacheMatrix' function. But before doing so, it checks if the inverse
## was already calculated. if yes, it skips the step and returns 'precalculated' 
## inverse and thus saves computational power.


cacheSolve <- function(x, ...) {
  invs <- x$getInverse()
  if (!is.null(invs)) {
    message("getting cache data")
    return(invs)            ## Return a matrix that is the inverse of 'x'
  }
  mat <- x$get()
  invs <- solve(mat, ...)
  x$setInverse(invs)        
}
