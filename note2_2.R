mydata = read.csv("onesample.csv")
head(mydata)
summary(mydata$birth_rate)
hist(mydata$birth_rate)
boxplot(mydata$birth_rate)

# 중심극한정리 CLT
표본의 수가 30이상이면 표본평균이 정규분포를 따른다. 

shapiro.test(mydata$birth_rate) #정규성 검정
# 귀무가설 : 정규분포를 따른다.
# 대립가설 : 정규분포를 따르지 않는다.
# 판정 : p>0.05이명 귀무가설 채택

t.result<-t.test(mydata$birth_rate, mu=1.31) 
t.result

mydata1 = read.csv("independent.csv") # 파일을 불러와 mydata1로 저장
head(mydata1) 
# 시각적인 도구
boxplot(birth_rate ~ dummy, data=mydata1)

# 집단별 요약 값 생성
mydata1 %>% 
  group_by(dummy) %>% 
  summarise(n=n(), mean=mean(birth_rate), sd=sd(birth_rate))

var.test(birth_rate ~ dummy, data=mydata1) # 등분산성 확인
t.test(birth_rate ~ dummy, data=mydata1, var.equal=F)

mydata2 = read.csv("paired.csv")
head(mydata2)

boxplot(mydata2$birth_rate_2010, mydata2$birth_rate_2015)
t.test(mydata2$birth_rate_2010-mydata2$birth_rate_2015, mu=0)
t.test(mydata2$birth_rate_2010, mydata2$birth_rate_2015, paired=T)

## 통계학개론
### 5. 표본분포
### 모집단 : 정규분포 -> 표본분포 : 정규분포
### 모집단 : X unknown -> 표본평균의 분포는 정규분포에 근사

### 6. 통계적 가설검정

### 7. t검정: 집단간 비교

독립T검정 : A 평균 <-> B 평균 비교
# boxplot 
# 요약값을 생성 
# 통계적가설검정 

mydata3 = read.csv("anova_one_way.csv")
head(mydata3)

# 시각화 한다
boxplot(birth_rate~ad_layer, mydata3)

mydata3 %>% 
  group_by(ad_layer) %>% 
  summarise(n=n(), mean=mean(birth_rate), sd=sd(birth_rate))

bartlett.test(birth_rate~ad_layer, mydata3)

# 등분산성 만족 : aov
# 등분산성 만족X : oneway.test
aov(birth_rate~ad_layer, mydata3) %>% TukeyHSD

oneway.test(birth_rate~ad_layer, mydata3)

mydata4 = read.csv("anova_two_way.csv") 
head(mydata4)
mydata4 %>% 
  group_by(ad_layer, multichild) %>% 
  summarise(n=n(), mean=mean(birth_rate), sd=sd(birth_rate)) -> result1

library(ggplot2)
ggplot(data=result1, aes(x=ad_layer, 
                         y=mean, fill=multichild))+
  geom_bar(stat="identity", position=position_dodge())

head(mtcars)
table(mtcars$cyl, mtcars$gear) %>% chisq.test()


