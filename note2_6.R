head(airquality)

model0 <- lm(Ozone~Temp, airquality )
summary(model0)
plot(model0)

model <- lm(Ozone~Solar.R+Wind+Temp, airquality )
summary(model)
influencePlot(model) -> inf2
rownames(inf2) %>% as.numeric -> sel

airquality2 <- airquality[-sel,]
model2 <- lm(Ozone~Solar.R+Wind+Temp, airquality2 )
summary(model2)


vif(model) # library(car)

library(MASS)
data(longley)
head(longley)
fit.ml <- lm(Employed~.-Year, data=longley)
vif(fit.ml)


