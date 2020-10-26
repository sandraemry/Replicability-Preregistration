#Here we are going to generate some data that reflects the growth of the sea star
  #First we will generate weight data
  #Then we will want to run a linear regression to find the % of change from initial wet mass

#Setting the seed to get reproducible random numbers, this value is arbitrary
set.seed(2020)

#Next we need to determine the number of weight(g) observations we will take (sample size, each sea star is weighed as a juvenile)
n <- 48

#We will want a normal distribution for initial wet mass in grams
x <- rnorm(n = 48, mean = 4.65, sd = 0.19)

#Our temperatures are on the x-axis and will be a pre-determined range (5-21 deg Celsius), not needed to be generated,
#Currently we have the initial growth measurements going into the 'x' variable, but this can be changed.

# I think we need to be able to apply the linear function from the paper to our initial mass to develop a growth curve#

#defining the slope and then the intercept of the original regression

#b0 <- SLOPE

#b1 <- INTERCEPT