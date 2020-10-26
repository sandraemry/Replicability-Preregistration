#Here we are going to generate some data that reflects the growth of the sea star#
  #First we will generate weight data#
  #Then we will want to run a linear regression to find the % of change from initial wet mass#

#Setting the seed to get reproducible random numbers, this value is arbitrary#
set.seed(2020)

#Next we need to determine the number of weight observations we will take (sample size, each sea star is weighed as a juvenille)#
n <- 48

#We will want a normal distribution for initial wet mass in grams#
x <- rnorm(n = 48, mean = 4.65, sd = 0.19)

# I think we need to be able to apply the linear function from the paper to our initial mass to develope a growth curve#


  