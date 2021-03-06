# R Basics basics and case study
# Misk Academy Data Science Immersive, 2020


source("in-class/1a - descriptive stats_rick.R")
# Always begin your R scripts with a descriptive header

# Load packages ----
# Install once, but initialize each time you start a new session
# We'll come back to this packages soon later on. I put this 
# command here since it's good practice to list all your used 
# packages at the beginning of a script
# library(tidyverse)
library(dplyr)
library(ggplot2)

# Basic R syntax ----
# What does this command do?
n <- log2(8)

# Exercise 1 ----
# Can you identify all the parts of the above commands?

# Exercise 2 ----
# Incomplete commands :/
# What happens if you execute this command?
# n <- log2(8)

# Plant Growth Case Study ----

# A built-in data set ----
PlantGrowth # already available in base R
data(PlantGrowth) # This will make it appear in your environment

# We're going to do something quite modern in R, which is to use a 
# tibble instead of a data.frame. That doesn't mean anything to you 
# now, but we'll get to it soon.
# First, make sure you have the tidyverse package installed and
# that you have executed the library(tidyverse) command
# above, after installing, so that you have initialized the package.
PlantGrowth <- as_tibble(PlantGrowth) # convert this to a "tibble" (more on this later)

# 1. Descriptive Statistics ----
# The "global mean" of all the weight values
mean(PlantGrowth$weight)

# Would this work on the group column? NO
# mean(PlantGrowth$group)

# Group-wise statistics
# Here, using functions from dplyr, a part of the Tidyverse
# Using Tidyverse notation:
# %>% is the "the pipe operator"
# Pronounce it as "... and then ..."
# Type it using shift + ctrl + m

# Use summarise() for aggregation functions ... 1 value as output
PlantGrowth %>%
  group_by(group) %>%
  summarise(avg = mean(weight),
            stdev = sd(weight))

# Or... an atypical example, but it can still be useful:
mean(PlantGrowth$weight[PlantGrowth$group == "ctrl"])

# For transformation functions: e.g. z-score within each group
# i.e. same # of output as # of input
# (x_i - x_bar)/x_sd
# function: scale()
# square, sq.root, add, multiply, divide, 
# log, "standardize" - scale to [0-1], remove background
# typically use mutate()

# for each weight in each group, calculate:
# 1 - square (x^2)
# 2 - subtract the mean of each group
PlantGrowth %>% 
  group_by(group) %>%
  mutate(square = weight^2,
         diff_global = weight - mean(PlantGrowth$weight),
         diff_group = weight - mean(weight),
         diff_sq = (weight - mean(weight))^2)

# Let's review the two most common syntax paradigms in R
# (This is kind of like different dialects of the same language,
#  some things are the same or very similar but there are key
#  differences that make them distinct systems.)
# Typical base pkg syntax
mean(PlantGrowth$weight)

# Tidyverse syntax
PlantGrowth$weight %>% 
  mean()
# %>% says take the object on the left (i.e. a dataframe) and insert it
# into the first position of the function on the right


# 2. Data Visualization ----
# Here, using functions from ggplot2, a part of the Tidyverse
# 3 essential components
# 1 - The data
# 2 - Aesthetics - "mapping" variables onto scales
# scales: x, y, color, size, shape, linetype
# 3 - Geometry - how the plot will look

p <- ggplot(PlantGrowth, aes(x = group, y = weight))
p

# box plot
p +
  geom_boxplot()


# Raw data
p +
  geom_point()

# "dot plot"
p +
  geom_jitter(width = 0.2, shape = 16, alpha = 0.75)

# "dot plot" (mean +/- 1SD)
p +
  geom_jitter(width = 0.2, shape = 16, alpha = 0.75) +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), col = "red")


# 3. Inferential Statistics ----
# first step: define a linear model
# ~ means "described by": y ~ x
plant_lm <- lm(weight ~ group, data = PlantGrowth)
plant_lm
summary(plant_lm)

# 1-way ANOVA
anova(plant_lm)

# For all pair-wise comparisons use:
TukeyHSD(aov(weight ~ group, data = PlantGrowth))


