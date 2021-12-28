# Never use these functions

# Attach a data set to the global env
# attach(PlantGrowth)
# detach(PlantGrowth)

# Remove all objects from the glocal env
# rm(list = ls())

# Setting and move the working directory
# setwd(...)

# These are ok:
getwd() # in linux or macOS pwd
list.files(all.files = TRUE) # like ls -la
list.files() # ls

