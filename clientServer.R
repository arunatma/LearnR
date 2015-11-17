# This assumes R and Python are already installed.

# To install Rserve: (in R)
#
#    1. install.packages("Rserve")
#       or
#       download the zip file and use install from local zip file option, or 
#                              use install_local(".zip") after loading devtools
#    2. Copy the Rserve.exe and Rserve.dll to the bin folder of x64 or i386

# On python side:
# To install pyRserve
#       1. Take corresponding numpy wheel from 
#           http://www.lfd.uci.edu/~gohlke/pythonlibs/#numpy                                     
#       2. pip install numpy-1.9.3+vanilla-cp27-none-win32.whl (for Windows)
#       3. pip install pyRserve

# Running:
# 1. Start the Rserve 
#       C:> c:\Program Files\R\R-3.2.2\bin\x64\Rserve.exe
#    This gets the R started as server listening in localhost:6311
# 2. On python side, follow the manual of pyRserve.
#    http://pythonhosted.org/pyRserve/manual.html


# Once Rserve is started, the client can be anything. 
# Haskell:
#   https://hackage.haskell.org/package/rclient
#   1. cabal install rclient 
#   2. Sample program at https://hackage.haskell.org/package/rclient-0.1.0.0/src/examples/Main.hs
# Tableau:
#   http://www.r-bloggers.com/dream-team-combining-tableau-and-r/