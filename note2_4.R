# 회귀분석 (인과관계)
## 독립변수 : 원인/ ## 종속변수 : 결과

# 1. 산점도
plot(dist ~ speed, cars)

# 2. 상관계수 계산
cor(cars$dist, cars$speed)

# 3. 회귀모형 
model <- lm(dist ~ speed + I(speed^2), cars)
summary(model) #dist = -17.5791+3.9324*speed

# 4. 회귀모형 해석

# 5. 회귀모형 시각화
library(ggplot2)
library(plotly)

ggplot(cars, aes(x=speed, y=dist))+
  geom_point()+  geom_smooth(method="lm")+theme_classic() -> a
ggplotly(a)


## 모형진단 (회귀모형 가정)
잔차 = 정규성, 독립성, 등분산성 

library(car)

## 정규성 확인
### 시각적
qqnorm(model$residuals)
qqline(model$residuals)

### 수치적 
shapiro.test(model$residuals)
boxCox(model)

model1 <- lm(dist^0.5 ~ speed, cars)
summary(model1) 
shapiro.test(model1$residuals)

## 독립성
### 시각적 : 잔차도표
plot(model$fitted.values, model$residuals)
### 수치적 
durbinWatsonTest(model)

## 등분산성
### 시각적 
spreadLevelPlot(model)
### 수치적
ncvTest(model1)










