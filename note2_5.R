alligator = data.frame(
  lnLength = c(3.87, 3.61, 4.33, 3.43, 3.81, 3.83, 3.46, 3.76,
               3.50, 3.58, 4.19, 3.78, 3.71, 3.73, 3.78),
  lnWeight = c(4.87, 3.93, 6.46, 3.33, 4.38, 4.70, 3.50, 4.50,
               3.58, 3.64, 5.90, 4.43, 4.38, 4.42, 4.25))

# 시각화 : plot(Y ~ X, data명)
plot(lnWeight~lnLength, alligator, pch=16, col="blue", cex=2)
plot(lnWeight~lnLength, alligator)

# 상관계수
cor(alligator$lnLength, alligator$lnWeight)

# |r| >0.8 : 매우 높은 상관성 (+ : 양의 관계, - : 음의 관계)
# 0.8 > |r| > 0.6 : 높은 상관성 (+ : 양의 관계, - : 음의 관계)
# 0.6 > |r| > 0.4 : 상관성이 있다 (+ : 양의 관계, - : 음의 관계)
# 0.4 > |r| > 0.2 : 낮은 상관성이 있다 (+ : 양의 관계, - : 음의 관계)

# 회귀분석 결과 해석
model <- lm(lnWeight~lnLength, alligator)
summary(model)

# 예상무게
predict(model, newdata=data.frame(lnLength=c(3.0,4.0,4.5)), 
        interval="prediction")
predict(model, newdata=data.frame(lnLength=c(3.0,4.0,4.5)), 
        interval="confidence")

# 시각화
library(plotly)
ggplot(data=alligator, aes(x=lnLength, y=lnWeight))+
  geom_point()+
  geom_smooth(method="lm") -> a
ggplotly(a)

