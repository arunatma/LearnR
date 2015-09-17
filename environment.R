###############################################################################
#  r_environment.r
#   - Explains essential commands which are helpful in R environment
#	- Listing, Saving, Loading of R objects
#
#  Author   : Arunram A
#  Creation : 27th Jan 2013
#
#  Revision History:
#
#
###############################################################################

###############################################################################
# I. R OBJECTS		
###############################################################################

# Lists all the R objects present in the current session
ls()

# Set up some R objects for illustration
obj1 = 3 * 3
obj2 = 4 + 2
obj3 = 7 * 7

# Sales all the R objects in the current session to the given binary file
save.image("all_obj.bin")

# Removes all R objects from the current session - Use with caution!
rm(list=ls())
remove(list = ls())		# Same as above

ls()	# Now no objects would get listed, as there are none

# Recreate some R objects for illustration
obj1 = 3 * 5
obj2 = 4 + 7
obj3 = 7 * 3

ls()	# Lists obj1, obj2, obj3

# Removes specified R objects - here obj1 and obj2
rm(obj1, obj2)
ls()	# Now the session contains only obj3

# Loads the obj1, obj2 and obj3 saved earlier; would overwrite obj3
load("all_obj.bin")

# Saves only obj1 and obj2 into the binary file
save(file="spec_obj.bin", obj1, obj2)

obj1 = 2 + 2
obj2 = 3 + 3

# This loads back obj1 and obj2 saved earlier, overwriting current contents
load("spec_obj.bin")

# Lists only those objects satisfying the regex pattern
ls(pat = ".*2")

###############################################################################
# II. R HISTORY		
###############################################################################

# Shows history (set of commands, recently typed) in a separate R window
history()
history(max.show = 10)	# Shows recent 10 commands, comments excluded
history(max.show = Inf)	# Shows all the commands in the current R session

# Use upward or downward arrows in the R command line interface to see 
# browse through recently typed commands

# Save the current history in a text file
savehistory("cur_history.txt")

# Load back the history from a text file
loadhistory("cur_history.txt")

###############################################################################
# III. Source and Sink
###############################################################################

# Sourcing the commands from external file
source("cur_history.txt")	# Source the commands from history file
source("sample_script.R")   # Source the commands from a dedicated R script

# Redirects all R output to out_file.txt. Overwrites the existing content
sink("out_file.txt")

# The following output will be written into out_file.txt
5 * 2
10 + 3
2 ^ 5

# Now out_file.txt contains 3 lines with values 10, 13 and 32 respectively

# unsinks the latest sink
sink()

# sink and unsink will be done in a LIFO (Last In First Out) fashion. 
# sink() takes out latest sink. Below, outer_file.txt will have 10 and 15, and
# the inner_file.txt will have 9

# Remember here that this does not overwrite the content of outer_file.txt,
# as it has not been unsinked yet.

sink("outer_file.txt")
5 * 2
sink("inner_file.txt")
3 * 3
sink()
5 * 3
sink()

###############################################################################
# IV. Packages
###############################################################################

# Installing a specific package (for example, zoo) from CRAN
install.packages("zoo")

# The above command asks for option to select a mirror for the current session
# To set a specific repo for the current installation command, use:
# or give any ftp or http address of a specific repository
install.packages("zoo", repo = http://cran.us.r-project.org)

# Loading an installed package in the current R session
library(zoo)

# Installing a specific package from Github
# Generic Syntax: install_github("package", "username")
# This needs devtools to be installed and loaded in the current session
install.packages("devtools")
library(devtools)

# To install rCharts 
install_github("rCharts", "ramnathv")
