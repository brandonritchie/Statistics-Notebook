library(tidyverse)

## Round 1

dat <- read_csv("rbdata1.csv")

col_inter <- interaction(as.factor(dat$x3), as.factor(dat$x2))

pairs(dat, col = as.factor(dat$x6))
mylm <- lm(y~x8 + I(x8^2) + x2 + x3+ x2:x8 + x2:I(x8^2) + x2:I(x8^3) + x3:x8 + x3:I(x8^2), data = dat)
summary(mylm)

plot(mylm, which = 1)

#plot(mylm$residuals~ ., data = dat)

b <- coef(mylm)

plot(y~x8, data = dat, pch = 16, col = col_inter)

x2 <- 0
x3 <- 1

curve(b[1] + b[2] * x + b[3] * x^2 + b[4] * x2 + b[5] * x3 + b[6] * x2 * x +  b[7] * x2 * x^2 + b[8] * x2 * x^3 + b[9] * x3 * x + b[10] * x3 * x^2, add = TRUE, col = "firebrick")

x2 <- 1
x3 <- 0

curve(b[1] + b[2] * x + b[3] * x^2 + b[4] * x2 + b[5] * x3 + b[6] * x2 * x +  b[7] * x2 * x^2 + b[8] * x2 * x^3 + b[9] * x3 * x + b[10] * x3 * x^2, add = TRUE)

x2 <- 0
x3 <- 0

curve(b[1] + b[2] * x + b[3] * x^2 + b[4] * x2 + b[5] * x3 + b[6] * x2 * x +  b[7] * x2 * x^2 + b[8] * x2 * x^3 + b[9] * x3 * x + b[10] * x3 * x^2, add = TRUE, col = "green")
## Round 2

col_inter <- interaction(as.factor(dat2$x10), as.factor(dat2$x6), as.factor(dat2$x3))

dat2 <- read_csv("rbdata2.csv")
pairs(dat2, col = as.factor(dat2$x10))

mylm2 <- lm(y~ x6 + x3 + x3:x10 + x7:x6 + x7:x10 + x6:x10 + x3:x6:x7+ x7:x6:x10+ x10:x3:x7 + x10:x6:x3 + x3:x6:x7:x10, data = dat2)
summary(mylm2)

b2 <- coef(mylm2)

plot(mylm2, which = 1)

plot(y~x7, col = col_inter, data = dat2, pch = 16)

x10 <- 0
x6 <- 0
x3 <- 0

curve(b2[1] + b2[2] * x6 + b2[3] * x3 + b2[4] *x3 *x10 + b2[5] * x6*x + b2[6] * x10*x + b2[7] * x6 * x10 + b2[8] * x6 * x3 * x + b2[9] * x6 * x10 * x + b2[10] * x3 * x10 * x + b2[11] *x6 *x3 *x10 + b2[12] *x6*x3*x10*x, add = TRUE)

x10 <- 1
x6 <- 0
x3 <- 0

curve(b2[1] + b2[2] * x6 + b2[3] * x3 + b2[4] *x3 *x10 + b2[5] * x6*x + b2[6] * x10*x + b2[7] * x6 * x10 + b2[8] * x6 * x3 * x + b2[9] * x6 * x10 * x + b2[10] * x3 * x10 * x + b2[11] *x6 *x3 *x10 + b2[12] *x6*x3*x10*x, add = TRUE, col = "red")

x10 <- 0
x6 <- 1
x3 <- 0

curve(b2[1] + b2[2] * x6 + b2[3] * x3 + b2[4] *x3 *x10 + b2[5] * x6*x + b2[6] * x10*x + b2[7] * x6 * x10 + b2[8] * x6 * x3 * x + b2[9] * x6 * x10 * x + b2[10] * x3 * x10 * x + b2[11] *x6 *x3 *x10 + b2[12] *x6*x3*x10*x, add = TRUE, col = "green")

x10 <- 0
x6 <- 0
x3 <- 1

curve(b2[1] + b2[2] * x6 + b2[3] * x3 + b2[4] *x3 *x10 + b2[5] * x6*x + b2[6] * x10*x + b2[7] * x6 * x10 + b2[8] * x6 * x3 * x + b2[9] * x6 * x10 * x + b2[10] * x3 * x10 * x + b2[11] *x6 *x3 *x10 + b2[12] *x6*x3*x10*x, add = TRUE, col = "lightblue")

x10 <- 1
x6 <- 1
x3 <- 0

curve(b2[1] + b2[2] * x6 + b2[3] * x3 + b2[4] *x3 *x10 + b2[5] * x6*x + b2[6] * x10*x + b2[7] * x6 * x10 + b2[8] * x6 * x3 * x + b2[9] * x6 * x10 * x + b2[10] * x3 * x10 * x + b2[11] *x6 *x3 *x10 + b2[12] *x6*x3*x10*x, add = TRUE, col = "blue")

x10 <- 1
x6 <- 0
x3 <- 1

curve(b2[1] + b2[2] * x6 + b2[3] * x3 + b2[4] *x3 *x10 + b2[5] * x6*x + b2[6] * x10*x + b2[7] * x6 * x10 + b2[8] * x6 * x3 * x + b2[9] * x6 * x10 * x + b2[10] * x3 * x10 * x + b2[11] *x6 *x3 *x10 + b2[12] *x6*x3*x10*x, add = TRUE, col = "purple")

x10 <- 0
x6 <- 1
x3 <- 1

curve(b2[1] + b2[2] * x6 + b2[3] * x3 + b2[4] *x3 *x10 + b2[5] * x6*x + b2[6] * x10*x + b2[7] * x6 * x10 + b2[8] * x6 * x3 * x + b2[9] * x6 * x10 * x + b2[10] * x3 * x10 * x + b2[11] *x6 *x3 *x10 + b2[12] *x6*x3*x10*x, add = TRUE, col = "yellow")

x10 <- 1
x6 <- 1
x3 <- 1

curve(b2[1] + b2[2] * x6 + b2[3] * x3 + b2[4] *x3 *x10 + b2[5] * x6*x + b2[6] * x10*x + b2[7] * x6 * x10 + b2[8] * x6 * x3 * x + b2[9] * x6 * x10 * x + b2[10] * x3 * x10 * x + b2[11] *x6 *x3 *x10 + b2[12] *x6*x3*x10*x, add = TRUE)
