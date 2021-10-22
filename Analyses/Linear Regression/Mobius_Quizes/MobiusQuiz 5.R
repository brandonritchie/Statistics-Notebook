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

mylm2 <- lm(qsec~disp + I(disp^2) + am + I(disp^2):am, data = mtcars)
summary(mylm2)

b <- coef(mylm2)

mtcars %>% 
  ggplot(aes(disp, qsec, color = as.factor(am)))+
  geom_point()+
  scale_color_manual(values = c("#eb2121", "#090b79"))+
  stat_function(fun = function(x) b[1] + b[2]*x + b[3]*x^2, color = "#eb2121")+
  stat_function(fun = function(x) (b[1] + b[4]) + (b[2] + b[5])*x + (b[3] + b[6])*x^2, color = "#090b79")+
  theme_bw()

par(mfrow=c(1,3))
plot(mylm2, which=1:2)
plot(mylm2$residuals)

## Question 4


  
