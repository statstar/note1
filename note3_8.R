data <- read.csv("mlr10.csv")
head(data)
dim(data)

model <- lm(X6~., data=data)
crPlots(model)

# 1. 다중공선성 문제가 있나요?
vif(model) # 다중공선성의 문제는 없다.

# 2. 변수 선택은 어떻게?
## 전진선택, 후진제거(*), 단계적변수선택
library(leaps)
regsub <- regsubsets(X6~., data=data)
plot(regsub, scale ="adjr")
plot(regsub, scale ="bic")
plot(regsub, scale ="Cp")

model1 <- lm(X6^(-0.3)~.-X7, data=data)

predict(model1, newdata=data)^(-1/0.3)


shapiro.test(model1$residuals) # 정규성검정
durbinWatsonTest(model1) # 독립성 만족
ncvTest(model1) # 등분산성 만족 X

boxCox(model1)






