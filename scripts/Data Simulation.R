
#Here we are going to generate some data that reflects the growth of the sea star
  #First we will generate weight data
  #Then we will want to run a linear regression to find the % of change from initial wet mass

#The model [ y = β0 + β1x + ε ]

#Setting the seed to get reproducible random numbers, this value is arbitrary
set.seed(5)

#Next we need to determine the number of weight(g) observations we will take (sample size, each sea star is weighed as a juvenile)
# we might not do this and rather have n defined per line
#n <- 19

#We want a normal distribution for temperature within a range, or else we change the run to categorical and set the temperatures
#from 5.04 -21.62 degress celcius - min and max values taken from data set

x <- runif(n = 19, min = 5.04, max = 21.62)

#We will want a normal distribution for the relative growth (change in wet mass/initial mass) this will represent epsilon (e)
#I'm not fully sure if this is the right way to input e, but without the slope and intercept it is hard to test if this makes sense
#Current values are for the initial mass of subjects. Calculations for relative growth were not given in the paper

#e <- rnorm(n = 48, mean = 4.65, sd = 0.19)


#defining the slope and then the intercept of the original regression
# initial regression equation taken from data gooding_harley_2009.csv

b0 <- 7.717

b1 <- -45.036

#Next we can try putting it all together and see if we get some data!
# I increased the standard deviation that is used to add noise to the data from the 1 that was given in the example to make the SE for simulated data more realistic

ytrue <- (b0 * x) + b1

ysim_norm <- ytrue + rnorm(n = 19, mean = 0, sd = 18)

#create data frame
df = data.frame(x, ysim_norm)

#visualize data with rudimentary plot  
plot(x,ysim_norm)

#create linear model
m <- lm(ysim_norm ~ x)
summary(m)

#create plot
plot(ysim_norm ~ x, data = df, xlim=c(0,25), ylim=c(-25,150), xlab= "Temperature (°C)", ylab= "Relative Growth (%)", pch=16) + 
  abline(lm(ysim_norm ~ x))

