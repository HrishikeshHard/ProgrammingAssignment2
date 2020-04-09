## We have two functions coded below in order to study lexical scoping in R.
## 1) makeCacheMatrix & 2) cacheSolve
## The first function creates a special matrix. This function contains 
## commands for 1) setting the matrix
##              2) getting the matrix
##              3) setting the inverse of the matrix
##              4) getting the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  invs <- NULL
  ## Below function 'sets' the value of the matrix and deletes the old inverse (if any)
  ## from the cache.
  set <- function(y) {
    x <<- y
    invs <<- NULL
  }
  ## The next function will 'get' the value of the matrix.
  get <- function() x
  ## The next function will 'set' the value of the inverse of the matrix.
  setInverse <- function(inverse) invs <<- inverse
  ## The next function will 'get' the value of the inverse of the matrix.
  getInverse <- function() invs 
  ## Now a list should be returned with above four functions.
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## The next function calculates the inverse of the matrix we create using 
## 'makeCacheMatrix' function. But before doing so, it checks if the inverse
## was already calculated.(This happens if there is no change made in the matrix) If yes,
## it shows precalculated value of inverse and thus saves computational power. If no, 
## it will calculate.


cacheSolve <- function(x, ...) {
  invs <- x$getInverse()
  if (!is.null(invs)) {
    message("getting cache data")
    return(invs)            
  }
##The above steps return the value of the matrix inverse if it was already present (cached)
##If there was no precalculated value, then the function below will calculate it AND will
##store it -'cache' it for future reference.   
  mat <- x$get()
  invs <- solve(mat, ...)
  x$setInverse(invs)        
}
