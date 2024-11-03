#            R Data Structure
# Vector
# Matrices
# Arrays
# Data frame
# Factors
# Lists


#       vector
# -> single data type
# -> one dimensional array

a <- c(1,2,3,4,5,6,7,8,9,-5)
b <- c("one", "two", "three")
c <- c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)
sum(a)
min(a)
max(a)

Name <- "hello world"
nchar(Name)
name <- c("hello", "world")
nchar(name)


#     Sort a Vector

x <- c(20,10,30,50,5,15)
sort(x)
y <- c("Y", "F", "G", "A", "I")
sort(y)

# Default sort function works on lower to upper  order

x <- c(20,10,30,50,5,15)
sort(x, decreasing = TRUE)
y <- c("Y", "F", "G", "A", "I")
sort(y, decreasing = TRUE)


#    Access Vector
#
#to access the vector item we need to use its index number
#in R index number always start form 1

a <- c(20,10,40,15)
a[1:4]

a <- c(20,10,40,15)
for(i in 1: length(a)){
  print(a[i])
}

a <- c(20,10,40,15)
for(i in 1: length(a)){
  print(a[i])
  if(i==2){
    break
  }
}


a <- c(20,10,40,15)
a[c(1,3)]




#               Matrices
#
#   -> Two dimensional Array
#   -> Each element has the same element (numeric, character,logical)
#   -> Created with matrix function
#   -> By default matrix ar in by column order

mymatrix <- matrix (1:20, nrow= 5, ncol=4, byrow= TRUE)
mymatrix

mymatrix[2,]
mymatrix[1,3]
mymatrix[, 3:4]

cells <- c(1:4)
rnames <- c("R1", "R2")
cnames <- c("C1","C2")
newmatrix <- matrix(cells, nrow=2, ncol=2, byrow= TRUE, dimnames=list(rnames,cnames))
newmatrix




#                      ARRAY
#   -> Similar to Matrices
#   -> Can have more than two dimension
#
#   myarray <- array (vector, dimension, dimnames)

myarray <- array (1:12, c(2,3,2))
myarray

myarray <- array (1:12, c(2,3,2))
myarray[2,3,1]



#                                        Data Frame
#
#   -> More General Than Matrix
#   -> Similar to Data Set

patientID <- c(1,2,3,4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type2")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientData <- data.frame(patientID, age, diabetes, status)
patientData