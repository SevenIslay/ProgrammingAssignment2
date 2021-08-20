## The functions are use to store the inverse of a matrix
## Optimizes the inverse calculation 


## This creates a specialized matrix that caches 
## the inverse if the matrix 'x'


makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    get <- function() x ## Getting the matrix
    set <- function(y) ## Setting the matrix
    { 
        x <<- y
        inv <- NULL ## Indicating that the cache is empty
    }
    setsolve <- function(i){ inv <<- i } ## Sets the Inverse
    getsolve <- function() inv ## Gets the Inverse
    list( get = get, set = set, setsolve = setsolve, getsolve = getsolve) 
}

## Return a matrix that is the inverse of 'x'
## Caches result that is returned
cacheSolve <- function(x, ...) {
    
    if(is.null(x$getsolve())) # If the inverse is null
        x$setsolve(solve(x$get(), ...)) # Solve the result and set the 
    # cache for the inverse
    x$getsolve() # Returns the cached result
}
