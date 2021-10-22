### Midterm ###

## 1
airquality

air_lm <- lm(Wind~Solar.R, data = airquality)
summary(air_lm)

## 2
library(mosaic)

RailTrail

rail_lm <- lm(volume~lowtemp, data = RailTrail)
summary(rail_lm)

plot(volume~lowtemp, data = RailTrail)
abline(rail_lm)

## 3
plot(Ozone ~ Temp, data=airquality)
# Y - 0.4877
summary(lm(Ozone ~ Temp, data=airquality))
# log(y) - 0.5473
plot(log(Ozone) ~ Temp, data=airquality)
# sqrt(Y) - 0.5527
plot(sqrt(Ozone) ~ Temp, data=airquality)
# Y^-1 - 0.08873
plot((Ozone^-1) ~ Temp, data=airquality)
summary(lm((Ozone^-1) ~ Temp, data=airquality))

## 5 - 298.27
(7.1^2)+(13^2)+(7.4^2)+(4.1^2)+(2.7^2)

## 6
summary(lm(dist~speed, cars))

##8
cars
cars_lm <- lm(sqrt(dist)~speed, cars)
predict(cars_lm, data.frame(speed = 20), interval = "prediction")^2

##9
mt_lm <- lm(mpg~wt, data = mtcars)
boxCox(mt_lm)
plot(mpg~wt, data = mtcars)
log_lm <- lm(log(mpg)~wt, data = mtcars)
exp(predict(log_lm, data.frame(wt = 4)))

plot(log(mpg)~wt, data = mtcars)

## 11
KidsFeetgirls <- KidsFeet %>% 
  filter(sex == "G")
kid_lm <- lm(width~length, data = KidsFeetgirls)
summary(kid_lm)
predict(kid_lm, data.frame(length = 25), interval = "prediction")

## 13
airquality
air_lm <- lm(Temp~Wind, data = airquality)
summary(air_lm)

## 14
cars_lm <- lm(dist~speed, cars)
plot(cars_lm,which=1)

cars %>% 
  filter(dist > 60, speed < 15)

## 16
ChickWeight
chick_lm <- lm(weight~Time, data = ChickWeight)
summary(chick_lm)
par(mfrow=c(1,3))
plot(cars_lm,which=1:2)
plot(cars_lm$residuals)

## 20
my_lm <- lm(height~age, data = Loblolly)
plot(my_lm,which=1)
plot(height~age, data = Loblolly)
abline(my_lm)

##21
my_lm <- lm(circumference~age, Orange)
summary(my_lm)
par(mfrow=c(1,3))
plot(my_lm,which=1:2)
plot(my_lm$residuals)

##22
?mpg

View(mpg)

plot(hwy ~ cty, data = mpg)

mpg.lm <- lm(hwy ~ cty, data=mpg)

##23
cars
cars_lm <- lm(sqrt(dist)~speed, data = cars)
cars_lm2 <- lm(dist~speed, data = cars)
summary(cars_lm)
boxCox(cars_lm)
b <- coef(cars_lm)
b2 <- coef(cars_lm2)
cars %>% 
  ggplot(aes(speed, dist))+
  geom_point()+
  stat_function(fun=function(x) (b[1] + b[2] * x)^2)+
  stat_function(fun = function(x) b2[1] + b2[2] * x)
