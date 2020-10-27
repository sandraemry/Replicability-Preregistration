#Here we are going to generate some data that reflects the growth of the sea star
  #First we will generate weight data
  #Then we will want to run a linear regression to find the % of change from initial wet mass

#The model [ y = β0 + β1x + ε ]

#Setting the seed to get reproducible random numbers, this value is arbitrary
set.seed(2020)

#Next we need to determine the number of weight(g) observations we will take (sample size, each sea star is weighed as a juvenile)
# we might not do this and rather have n defined per line
#n <- 48

#We want a normal distribution for temperature within a range, or else we change the run to categorical and set the temperatures
#from 5 -21 degress celcius

x <- runif(n = 24, min = 5, max = 21)

#We will want a normal distribution for the relative growth (change in wet mass/initial mass) this will represent epsilon (e)
#I'm not fully sure if this is the right way to input e, but without the slope and intercept it is hard to test if this makes sense
#Current values are for the initial mass of subjects. Calculations for relative growth were not given in the paper

e <- rnorm(n = 48, mean = 4.65, sd = 0.19)


#defining the slope and then the intercept of the original regression

#b0 <- SLOPE

#b1 <- INTERCEPT

#Next we can try putting it all together and see if we get some data!

#  y = β0 + β1x + ε 



