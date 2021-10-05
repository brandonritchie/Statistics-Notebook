## 9/27/2021 Notes

# Diagnostics plots

library(tidyverse)

log(5000)

hist(log(islands), col = "forestgreen")

exp(4)
log(10000)

library(mosaicData)
View(Utilities)
?Utilities

plot(gasbill~temp, data = Utilities)
abline(lm(gasbill~temp, data = Utilities))

plot(log(gasbill)~temp, data = Utilities)


mylm.log<- lm(log(gasbill)~temp, data = Utilities)
b <- coef(mylm.log)
b

# Plot exponential line
plot(gasbill~temp, data = Utilities)
curve(exp(b[1]+b[2]*x),add = TRUE)

ggplot(Utilities, aes(x = temp, y = gasbill))+
  geom_point()+
  stat_function(fun = function(x) exp(b[1] + b[2] * x))

library(car)
dat2 <- Davis %>% filter(weight<160)
myLM <- lm(height~weight, data = dat2)
summary(myLM)

summary(lm(income~prestige, Prestige))


summary(lm(IQbio~IQfoster, data = Burt))
?Burt

mylm <- lm(mpg~disp, data = mtcars)
plot(mpg~disp, data = mtcars)
abline(summary(lm(mpg~disp, data = mtcars)))
par(mfrow = c(1,3))
plot(mylm, which=1)


summary(lm(circumference~age, data = Orange))

boxCox(lm(circumference~age, data = Orange))
summary(lm(sqrt(circumference)~age, data = Orange))
mylm <- lm(sqrt(circumference)~age, data = Orange)
mylm2 <- lm(circumference~age, data = Orange)
plot(sqrt(circumference)~age, data = Orange)


predict(mylm, data.frame(age = 500))

b <- coef(mylm)
plot(circumference~age,data = Orange)
curve(b[1] + b[2]*x^-2, add=TRUE, col="green", lwd=2)
