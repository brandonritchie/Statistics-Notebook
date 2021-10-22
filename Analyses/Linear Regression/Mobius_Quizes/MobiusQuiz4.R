## Problem 1
library(alr4)

my_lm <- lm(HT18~HT2, data = BGSall)

summary(my_lm)

plot(HT18~HT2, data = BGSall)
abline(my_lm)

b <- coef(my_lm)

## Intercept = 0 for null SAME as summary output

## Slope = 0 for null
MSE = 7.422^2
# Find t-value
t = (b[2] - 2) / sqrt(MSE / ((sum(BGSall$HT2 - mean(BGSall$HT2))^2)))
# Find p-value
pt(abs(t), 134)

library(tidyverse)
mylm <- lm(Length~Scale, data = wblake)
mylm2 <- lm(sqrt(Length)~Scale, data = wblake)

summary(mylm)

bo <- coef(mylm)
bt <- coef(mylm2)

wblake %>% 
  ggplot(aes(Scale, Length))+
  geom_point(alpha = 0.1)+
  geom_smooth(method = "lm")+
  theme_bw()

predict(mylm2, data.frame(Scale = 10), interval = "prediction")
pt(abs())