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

plot(mpg~age, data = Orange, pch =16, col = "red")