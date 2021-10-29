library(mosaic)
library(tidyverse)

## Question 1
my_lm <- lm(gasbill~month + I(month^2), data = Utilities)
b <- coef(my_lm)

plot(gasbill ~ month, data = Utilities)

curve(b[1] + b[2]*x+b[3]*x^2, col = "skyblue", lwd = 2, add=TRUE)

par(mfrow=c(1,3))
plot(my_lm, which=1:2)
plot(my_lm$residuals)

predict(my_lm, data.frame(month = 9), interval = "prediction")

Utilities %>% group_by(month) %>% summarise(mean_n = mean(gasbill))

## Question 2
mtcars

mylm2 <- lm(mpg~qsec + am + qsec:am, data = mtcars)

b <- coef(mylm2)

mtcars %>% 
  ggplot(aes(qsec, mpg, color = as.factor(am)))+
  geom_point()+
  stat_function(fun = function(x) b[1] + b[2]*x, color = "red")+
  stat_function(fun = function(x) (b[1] + b[3]) + (b[2] + b[4])*x, color = "blue")

par(mfrow=c(1,3))
plot(mylm2, which=1:2)
plot(mylm2$residuals)

## Question 3
mtcars

mylm2 <- lm(qsec~disp + I(disp^2) + am + disp:am+ I(disp^2):am, data = mtcars)
summary(mylm2)

b <- coef(mylm2)

mtcars %>% 
  ggplot(aes(disp, qsec, color = as.factor(am)))+
  geom_point()+
  scale_color_manual(values = c("#eb2121", "#090b79"))+
  stat_function(fun = function(x) b[1] + b[2]*x + b[3]*x^2, color = "#eb2121")+
  stat_function(fun = function(x) (b[1] + b[4]) + (b[2] + b[5])*x + (b[3] + b[6])*x^2, color = "#090b79")+
  theme_bw()

# Code
#Welldone!

par(mfrow=c(1,3))
plot(mylm2, which=1:2)
plot(mylm2$residuals)

## Question 4

## Simulating Data from a Regression Model
## This R-chunk is meant to be played in your R Console.
## It allows you to explore how the various elements
## of the regression model combine together to "create"
## data and then use the data to "re-create" the line.

set.seed(101) #Allows us to always get the same "random" sample
#Change to a new number to get a new sample

n <- 100 #set the sample size

X1_i <- runif(n, -2, 3) 
X2_i <- sample(c(0,1), n , replace = TRUE)
#Gives n random values from a uniform distribution between 15 to 45.

beta0 <- -2 #Our choice for the y-intercept. 
beta1 <- 3 #Our choice for the slope. 
beta2 <- 4 # quadratic term
beta3 <- 4 #Change in intercept
beta4 <- 2 # Change in slope
beta5 <- -7 # Change in quadratic

sigma <- 2 #Our choice for the std. deviation of the error terms.

epsilon_i <- rnorm(n, 0, sigma) 
#Gives n random values from a normal distribution with mean = 0, st. dev. = sigma.

Y_i <- beta0 + beta1*X1_i + beta2 * X1_i^2 + beta3 * X2_i + beta4* X1_i * X2_i + beta5 * X1_i^2 * X2_i + epsilon_i 

fabData <- data.frame(y=Y_i, x1=X1_i, x2 = X2_i) 

fab.lm <- lm(y ~ x1 + I(x1^2) + x2 + x1:x2 + I(x1^2):x2, data=fabData) #Fit an estimated regression model to the fabData.

b <- coef(fab.lm)
summary(fab.lm) #Summarize your model. 

plot(y ~ x1, col = as.factor(x2), data=fabData, ylim = c(-5,5)) #Plot the data.

curve(b[1] + b[2]*x + b[3] * x^2, add = TRUE) #Add the estimated regression line to your plot.

curve((b[1] + b[4]) + (b[2] + b[5])*x + (b[3] + b[6])*x^2, add = TRUE)


# Now for something you can't do in real life... but since we created the data...

curve(beta0+beta1*x+beta2*x2+beta3*x*x2, lty=2, add = TRUE) 
#Add the true regression line to your plot using a dashed line (lty=2). 

#legend("topleft", legend=c("True Line", "Estimated Line"), lty=c(2,1), bty="n") 
  

library(Ecdat)

mylm <- lm(wage~school + I(school^2), data = Wages1)

mylm <- lm(height~age + I(age^2)+ I(age^3), data = Loblolly)
mylm2 <- lm(height~age + I(age^2) + I(age^3) + I(age^4) + I(age^5), data = Loblolly)
mylm3<- lm(height~age + I(age^2) + I(age^3) + I(age^4), data = Loblolly)
mylm4 <- lm(height~age + I(age^2), data = Loblolly)


plot(mylm, which=1)
plot(mylm2, which=1)
plot(mylm3, which=1)
plot(mylm4, which=1)

summary(mylm)
summary(mylm2)
summary(mylm3)
summary(mylm4)
