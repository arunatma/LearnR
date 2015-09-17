###############################################################################
#  data_structures.r
#   - Explains basic data structures in R
#   - Scalars, Vectors, Matrix, Data Frame, List
#
#  Author   : Arunram A
#  Creation : 26th Sep 2013
#
#  Revision History:
#
#
###############################################################################

# Create a scalar object var_sample and assigns value 1 to it
var_sample = 1

# A scalar can contain numbers or characters
var1 = "Rlanguage"

# A scalar can contain a complex number too
var2 = 5+3i

# A vector contains a set of values
vec_1 = c(1,2,3,4,5)    # Produces a vector using the combine function "c"
print(vec_1)            # Prints to console, the value of object vec_1

# A vector can also be created using the vector command
vec_2 = vector(mode="numeric", length=5)            # Create and Initialize
print(vec_2)            # [1] 0 0 0 0 0             (a vector with 5 zeros)
vec_2                   # Performs the same task as print(...)

vec_3 = vector(mode="character", length=5)          # Create and Initialize
print(vec_3)            # [1] "" "" "" "" ""        (5 empty strings)

vec_4 = vector(mode="logical", length=5)            # Create and Initialize
print(vec_4)            # [1] FALSE FALSE FALSE FALSE FALSE     


vec_4 = vector(mode="complex", length=3)            # Create and Initialize
print(vec_4)            # [1] 0+0i 0+0i 0+0i

# A vector will be able to store values of identical datatypes

# The following command assigns strings "a", "1" and "FALSE" to vec_a
vec_a = c("a", 1, FALSE)
vec_a

# The following command assigns integers 0 and 100 to vec_a
vec_a = c(FALSE, 100)
vec_a

# The following command assigns strings "TRUE", "a" and "100" to vec_a
vec_a = c(TRUE, "a", 100)
vec_a

#------------------------------------------------------------------------------

# Creation of vectors using other commands
# seq(start, end, step) Command
seq(1, 100, 3)              # Generates a vector with values 1, 4, 7
seq(from=1, to=100, by=3)   # same as the above
seq(1, 100, length=25)      # Generates 25 values 1, 5.125, 9.250, ..., 100
seq(25)                     # Generates the first 25 integers

y = seq(1, 100, 3)
x = seq(along = y)          # Generates a sequence of numbers equal to length(y)
x = seq(length(y))          # Same as above

# : Colon operator
1:25  # This can be assigned to an object vec_5 = 1:25
5:10  # This can also be written as seq(6) + 4
7:11
# Both seq function and : operator can be used only with double(real) datatypes

# rep(. , n) repeats . n times - used with char, real, logical and complex
rep(1, 5)               # Generates 1 1 1 1 1
rep("a", 3)             # Generates "a" "a" "a"
rep(3+4i, 2)            # Generates 3+4i 3+4i

#------------------------------------------------------------------------------

# Matrix - Stores values in rows and columns together 
# Very similar to vector - all elements in a matrix will have the same datatype
matrix(1:16, nrow=8, ncol=2)        # will have 1:8 in col1 and 9:16 in col2

# Generates 8 rows with values (1,2), (3,4), (5,6) ...
matrix(1:16, nrow=8, ncol=2, byrow=TRUE) 
matrix(1:16, 8, 2, byrow=TRUE)      # Same as above
matrix(1:16, 8, 2, TRUE)            # Same as above
matrix(seq(16), 8, 2, TRUE)         # Same as above


# Matrix can also be created using cbind and rbind functions
# Column Bind
cbind(1:8, 9:16)  # Same as matrix(1:16, nrow=8, ncol=2)

# Row Bind
rbind(1:8, 9:16)   # Same as matrix(1:16, nrow=2, ncol=8, byrow=TRUE)

vec_1 = c("l", "e", "a", "r", "n")
vec_2 = c("R", "c", "o", "d", "e")
char_mat = cbind(vec_1, vec_2)  # Creates matrix with 2 columns, 5 char. each
char_mat                            # Display the matrix
vec_3 = c("q", "u", "i", "c", "k")
char_mat = cbind(char_mat, vec_3)   # Combines a matrix with a column
char_mat                            # Display the matrix

# Can this character matrix be combined with integer values?
char_mat = cbind(char_mat, 1:5)     # Combines the matrix with vector 1:5
# 1 to 5 are converted to strings "1" "2" "3" "4" "5" and added as a column
char_mat                            # Display the matrix

# Special Cases
# Repeats the vector to fill up size of matrix. Gets no warning.
matrix(1:5, 5, 2)       

# Repeats fill up size of matrix - to possible extent.  Gets warning.
matrix(1:5, 7, 2)       

# Not enough space to fill even once - gets the same warning as above
matrix(1:5, 2, 2)       

#------------------------------------------------------------------------------

# Array - Similar to a matrix, but with more than 2 dimensions

# Creates a 4x5x5 dimension array and fills up numbers from 1 to 100
array(1:100, dim=c(4,5,5))

# The following command stores all elements as strings 
array(c(1:98,"a","b"), dim=c(4,5,5))

# Each dimension can be given a name using "dimnames" (a list)
dim_list = list(c("D11","D12"),c("D21","D22"), c("D31","D32"))
array(1:8, dim=c(2,2,2), dimnames=dim_list)

# If the product of dim is less than length, the rem. elements are ignored.
array(1:100, dim=c(4,5,4))      # 81:100 is ignored

# If the product of dimensions is more than length, the elements get reused.
array(1:100, dim=c(4,5,6))      # 1:20 is reused again

# An existing vector can also be converted in an array
a = 1:12
dim(a) = c(2,2,3)           # Now 'a' is converted to an array 2x2x3

# Here if the product of dimensions do not equal the length, throws error
dim(a) = c(2,2,2)           # Error
dim(a) = c(2,2,4)           # Error

# attributes - gets various attributes associated with an R object
attributes(a)

a = 1:12
dim(a) = c(2,2,3)
class(a)                # Returns the class of the R object 'a' - Here "array"
dim(a) = c(2,6)
class(a)                # Now the class is changed to "matrix"
dim(a) = c(2,2,3)       # Let us keep this as array itself.

#------------------------------------------------------------------------------

# Data Frame - Similar to matrix - but can contain multiple datatypes 
L3 = LETTERS[1:3]
# sample(L3, 10, replace=TRUE) generates a sample with size=10 from L3
char_sample = sample(L3, 10, replace=TRUE)

# Creates data frame with three columns x, y and fac
d = data.frame(x=seq(2,20,2), y=1:10, fac=char_sample)

# Data frame creation without column names.  R assigns appropriate names
d = data.frame(seq(2,20,2), 1:10, char_sample)

# Data frame creation with row names
rowchars = paste("Row",1:10,sep="")
d = data.frame(x=seq(2,20,2), y=1:10, fac=char_sample, row.names=rowchars)

# The same functionality can also be obtained using
row.names(d) = rowchars             # row names to existing data frame.

# All columns should be of same length in a data frame
# The following creation statement generates an error because sizes mismatch
d = data.frame(x=1:10, y=1:11, fac=char_sample, row.names=rowchars)

# attributes - gets various attributes associated with an R object
attributes(d)           
names(d)                                # Contains the column names
row.names(d)                            # Contains the row names
names(d) = c("Col_1", "Col_2", "Col_3") # Column names are changed for df. d

# Accessing Elements
d[,1]                   # Gives all elements of 1st Column as a vector
d[2,]                   # Gives all elements of 2nd row as a vector
d$Col_1                 # The column can also be accessed in this way
d[2,3]                  # Access the 2nd Row, 3rd element
    
#------------------------------------------------------------------------------

# List - The most comprehensive data structure in R.
# Contains any data type of any length.

l = list(c(1:10), c(3,5,7,11), c(1, 1, 2, 3, 5, 8), c("s", "a", "l", "e", "m"))

# Access using double square brackets 
l[[1]]                  # To access the 1st element of the list - here c(1:10)

# d and a are the data frame and array as defined above.
advlist = list(l, d, a) # advlist constains a list, data frame and an array
advlist[[1]][[4]]       # Gives the vector "s" "a" "l" "e" "m"
advlist[[2]]            # is a data frame
advlist[[2]]$Col_3      # Access the Col_3 of the dataframe 

advlist = list(list=l, df=d, array=a)       # Gives names to each element
# Note: list, df, array are all keywords, but here act as mere names 

# Now the elements can be accessed using the names.
advlist$list                # Same as advlist[[1]]
advlist$df                  # Same as advlist[[2]]

names(advlist)              # Gives "list", "df", "array"

# The names can also be assigned in this fashion
advlist = list(l, d, a) # advlist constains a list, data frame and an array
names(advlist) = c("list", "df", "array")
