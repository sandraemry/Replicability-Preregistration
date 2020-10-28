library(tidyverse)
library(broom)

# Here we are going to generate some data that reflects the growth of the sea star
 

# Setting the seed to get reproducible random numbers, this value is arbitrary
set.seed(5)

# Next we need to determine the number of weight(g) observations we will take (sample size, each sea star is weighed as a juvenile)
#  we will define n = 19 defined when addressing the independent variable

# We want a normal distribution for temperature within a range
# from 5.04 -21.62 degrees celcius - min and max values taken from data set

x <- runif(n = 19, min = 5.04, max = 21.62)


# defining the slope and then the intercept of the original regression
# initial regression equation taken from data gooding_harley_2009.csv

b0 <- 7.717

b1 <- -45.036

# Next we can try putting it all together and see if we get some data!
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

## creating a df with predicted values from model output
predicted <- augment(m, se_fit = TRUE)

growth_with_temp <- 
  ggplot(data = predicted, aes(x = x, y = ysim_norm)) + 
  geom_point() + 
  labs(x = "Temperature (°C)", y = "Relative Growth (%)") + 
  geom_line(aes(y = .fitted)) + 
  geom_ribbon(aes(y = .fitted, 
                            ymax = (.fitted + .se.fit), 
                            ymin = (.fitted - .se.fit)), alpha = 0.25) + 
  theme_bw()

ggsave("./figures/growth_with_temp.png", growth_with_temp, 
       height = 5, width = 7, units ="in")

#---------- Same analysis but with feeding rate, x remains the same as above ---

# defining the slope and then the intercept of the original regression
# initial regression equation taken from data gooding_harley_2009.csv

c0 <- 0.109

c1 <- -0.218

# Next we can try putting it all together and see if we get some data!
# I increased the standard deviation that is used to add noise to the data from the 1 that was given in the example to make the SE for simulated data more realistic

ytruefeed <- (c0 * x) + c1

ysim_normfeed <- ytruefeed + rnorm(n = 19, mean = 0, sd =0.3)

#create data frame
df = data.frame(x, ysim_norm, ysim_normfeed)

#visualize data with rudimentary plot  
plot(x,ysim_normfeed)

#create linear model
m2 <- lm(ysim_normfeed ~ x)
summary(m2)

#create plot
plot(ysim_normfeed ~ x, data = df, xlim=c(0,25), ylim=c(0,3), xlab= "Temperature (°C)", ylab= "Feeding rate (mussels/seastar/day)", pch=16) + 
  abline(lm(ysim_normfeed ~ x))

## creating a df with predicted values from model output
predicted2 <- augment(m2, se_fit = TRUE)

feeding_with_temp <- 
  ggplot(data = predicted2, aes(x = x, y = ysim_normfeed)) + 
  geom_point() + 
  labs(x = "Temperature (°C)", y = "Feeding rate (mussels/seastar/day)") + 
  geom_line(aes(y = .fitted)) + 
  geom_ribbon(aes(y = .fitted, 
                  ymax = (.fitted + .se.fit), 
                  ymin = (.fitted - .se.fit)), alpha = 0.25) + 
  theme_bw()

ggsave("./figures/feeding_with_temp.png", growth_with_temp, 
       height = 5, width = 7, units ="in")


