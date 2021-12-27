# Intro to R
# Rick Scavetta
# Misk DSI Explore the Martian dataset

# R syntax


# Functions - name followed by () - like verbs in grammar, they do things 
# Arguments - input to functions (named or unnamed, access by name or position)
#           - Can be a number, character, object, function
# Comment - anything after a # (it will be ignored by the R interpreter)
# Object - anything in our environment - like a noun, it's a thing that you can handle

# Parameter - sometimes used instead of arguments but only in specific cases
#           - we'll see this more in Machine Learning and Deep Learning

# Package - collection of functions, e.g. base package
# Library - collection of packages

# Load packages


# Import data





# Explore your data

# Intro Case Study
PlantGrowth # already available
PlantGrowth <- as_tibble(PlantGrowth)

# Typical dplyr command
# "Literate programming"
# %>% = "The (forward) pipe operator"
# pronounce as "... and then ..."
# %>% is literally => take the object on the LHS
# and put it as the first argument of the function 
# on the RHS
PlantGrowth %>%
  group_by(group) %>%
  summarise(avg = mean(weight),
            stdev = sd(weight))

# Use the commands we've seen so far to calculate
# Some descriptive statistics (that we saw in class) 
# on the Height variable in the martian dataset 
# (either as a whole, or split by site)

# mean, stdev, median, IQR, Q0 (min), Q4 (max), Range (Q4 - Q0), variance
# Extra challenge:  try to calculate some of these from scratch



