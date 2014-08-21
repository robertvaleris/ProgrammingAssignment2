
## in makeCacheMatrix I create a list containing 4 other functions that are to be called upon by cacheSolve. Also, when it is executed, the cached 's' 
##is set to NULL

makeCacheMatrix<-function(datamatrix=matrix()) {
        s<<-NULL
        y<<-NULL
        set<-function (x) {
                y<<-x
                s<<-NULL
        }
        get<-function() {x}
        setsolve<-function (solve) { s<<-solve}
        getsolve<-function () {s}
        ox<<-list(set=set, get=get, setsolve=setsolve, getsolve=getsolve)
        
}


## in cacheSolve the input matrix is compared with a previous matrix (if possible), if that is the first input matrix or it is different from 
##the last input matrix, then this function will compute its inverse, otherwise the function will display the cached inverse of the matrix.


        
cacheSolve<-function (datamatrix){
        x<<-datamatrix
        if(identical(x,y)){
                s<-ox$getsolve()
        }
        else {
                ox$set(x)
        }
        if(!is.null(s)){
                message("getting cached data")
                return (s)
                ## Return the cached inverse of the matrix since the input matrix and the previous matrix are the same  
        }
        else{
                data<-ox$get()
                s<-solve(data)     
                ox$setsolve(s)
                s
                ## Return a matrix that is the inverse of 'datamatrix'  
        }
}
