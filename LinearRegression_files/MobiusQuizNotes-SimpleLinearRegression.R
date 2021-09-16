# Simple Linear Regression Mobius Quiz

## Air Quality
# Model
model <- lm(Wind~Temp, data = airquality)
summary(model)

# Plotting the Model
plot(Wind~Temp, data = airquality)
abline(model)

# Make Prediction
predict(model, data.frame(Temp = 72))

# Technical Details
# Residual vs Fitted
par(mfrow=c(1,3))
plot(model, which = 1:2)
plot(model$residuals)

## mtcars
# Model
model <- lm(mpg~wt, data = mtcars)
summary(model)

# Plotting the model
plot(mpg~wt, data = mtcars)
abline(model)

# Make a prediction
predict(model, data.frame(wt = 3))

# Technical Details
# Residual vs Fitted
par(mfrow=c(1,3))
plot(model, which = 1:2)
plot(model$residuals)

