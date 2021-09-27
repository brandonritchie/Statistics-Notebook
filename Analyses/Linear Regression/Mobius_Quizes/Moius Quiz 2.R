# Mobius Quiz - Residuals, Sums of Squares, and R-squared

## Problem 1
Orange

myLM <- lm(circumference~age, data = Orange)
summary(myLM)

plot(circumference~age, data = Orange, pch =16, col = "red")
abline(myLM,col = "firebrick")

# SSE
SSE <- sum(myLM$res^2)
SSE
#SSR
SSR <- sum((myLM$fit - mean(Orange$circumference))^2)
SSR
#SSTO
SSTO <- SSE + SSR
SSTO  
# R Squared
r <- SSR/SSTO
r

r^0.5

predict(myLM, data.frame(age = 3*365))

## Problem 2
mtcars

plot(mpg~wt, data = mtcars, pch =16, col = "red")
plot(mpg~cyl, data = mtcars, pch =16, col = "red")
plot(mpg~hp, data = mtcars, pch =16, col = "red")

wtLM <- lm(mpg~wt, data = mtcars)
cylLM <- lm(mpg~cyl, data = mtcars)
hpLM <- lm(mpg~hp, data = mtcars)

SSE_fun <- function(LM1){
  sum(LM1$res^2)
}
SSE_fun(wtLM)
SSE_fun(cylLM)
SSE_fun(hpLM)

SSR_fun <- function(LM1, dat){
  sum((LM1$fit - mean(mtcars$mpg))^2)
}
SSR_fun(wtLM)
SSR_fun(cylLM)
SSR_fun(hpLM)

SSTO_fun <- function(LM1, dat){
  SSE <- SSE_fun(LM1)
  SSR <- SSR_fun(LM1, dat)
  
  SSE + SSR
}
SSTO_fun(wtLM, mtcars)
SSTO_fun(cylLM, mtcars)
SSTO_fun(hpLM, mtcars)

r_squared <- function(LM1, dat){
  SSR <- SSR_fun(LM1, dat)
  SSTO <- SSTO_fun(LM1, dat)
  SSR/SSTO
}
r_squared(wtLM, mtcars)
r_squared(cylLM, mtcars)
r_squared(hpLM, mtcars)

# Diagnostics Plots
par(mfrow = c(1,9))
plot(wtLM, which=1:2)
plot(wtLM$residuals)

par(mfrow = c(1,3))
plot(cylLM, which=1:2)
plot(cylLM$residuals)

par(mfrow = c(1,3))
plot(hpLM, which=1:2)
plot(hpLM$residuals)
