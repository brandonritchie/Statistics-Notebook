library(mosaic)
library(tidyverse)

my_lm_t <- lm(sqrt(sqrt(gasbill))~temp, data = Utilities)
my_lm <- lm(gasbill~temp, data = Utilities)
boxCox(my_lm, lambda = seq(0,1,0.1))
bt <- coef(my_lm_t)
b <- coef(my_lm)

pred_t1 <- predict(my_lm_t, data.frame(temp = 30), interval = "prediction")
pred_o1 <- predict(my_lm, data.frame(temp = 30), interval = "prediction")

pred_t2 <- predict(my_lm_t, data.frame(temp = 60), interval = "prediction")
pred_o2 <- predict(my_lm, data.frame(temp = 60), interval = "prediction")

Utilities %>% 
  ggplot(aes(temp, gasbill))+
  geom_point()+
  stat_function(fun = function(x) b[1] + b[2]*x, color = "hotpink")+
  stat_function(fun = function(x) (bt[1] + bt[2]*x)^4, color = "skyblue")+
  geom_segment(aes(x = 30, xend = 30, y = (pred_t1[2])^4, yend = (pred_t1[3])^4), size = 4, color = "skyblue", alpha = 0.01)+
  geom_segment(aes(x = 30, xend = 30, y = pred_o1[2], yend = pred_o1[2]), size = 4, color = "hotpink")+
  geom_segment(aes(x = 60, xend = 60, y = pred_o2[2], yend = pred_o2[2]), size = 4, color = "hotpink", alpha = 0.01)+
  geom_segment(aes(x = 60, xend = 60, y = (pred_t2[2])^4, yend = (pred_t2[2])^4), size = 4, color = "skyblue")

summary(my_lm)

## How to find the p-value
pt(-abs(-24.88), 115)*2

Utilities %>% filter(temp >35, gasbill > 150)

predict(my_lm, data.frame(temp = 41))

153-103.992

par(mfrow = c(1,3))
plot(my_lm, which = 1:2)
plot(my_lm$residuals)
