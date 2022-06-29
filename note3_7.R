setwd("F:/intermediate3-master")
data <- read.csv("slr02.csv")
head(data)

# 1. 산점도 그리기
plot(Y~X, data=data)

# 2. 상관계수 구하기
cor(data$X, data$Y)

# 3. 통계모형 (회귀모형)
model <- lm(Y~X+I(X^2), data=data[-3,])
summary(model)

plot(model)
## 정규성
shapiro.test(model$residuals) #p>0.05 정규성 만족

## 독립성
set.seed(12312)
durbinWatsonTest(model) # p<0.05 독립성 만족 

## 등분산성
ncvTest(model) # p>0.05 등분산성 만족
influencePlot(model)

plot(Y~X, data=data[-3,])
X <- 65:95
pred.y <- predict(model, newdata=data.frame(X))
lines(X,pred.y, col="blue")




