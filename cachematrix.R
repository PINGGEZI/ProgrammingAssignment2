
##The following two functions are used to create a speical object that store
##a matrix and caches its inversion.





#The makeCacheMatrix creates a special "matrix", which is a list 
#containing functions to 
#set the value of the matrix
#get the value of the matrix
#set the value of the inversion
#get the value of the inversion

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inversion) i <<- inversion
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
        ## Return a matrix that is the inverse of 'x'
}

