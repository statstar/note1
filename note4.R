head(mtcars)
dim(mtcars)

# 1. mpg > 25 초과이면서 기어가 5단인 차량은 몇대인가요?
library(dplyr)

# 30 > mpg >= 20 인 차량은 몇대인가?
mtcars %>% 
  filter(30>mpg>=20)
mtcars %>% 
  filter(30>mpg, mpg>=20)
mtcars %>% 
  filter(between(mpg,20,29.9))

# 몸무게가 가장 많이 나가는 참여자는 누구인가요?
diet %>% 
  filter(gender==1) %>% 
  arrange(-Height) %>% 
  head(3) %>% 
  select(-1, -2, -3)

diet %>% 
  mutate(BMI= pre.weight/((Height*0.01)^2))  %>% 
  mutate(cat1 = ifelse(diet2$BMI<18.5,"저체중",
                       ifelse(diet2$BMI<23,"정상",
                              ifelse(diet2$BMI<25,"과체중","비만"))))  %>% 
  head

diet2$BMI  
# BMI가 18.5 이하 : “저체중”, 18.5~23 : “정상”, 23~25 : “과체중”, 25~ : “비만” 이다.
cut1 <- cut(diet2$BMI, c(0,18.5,23,25,40), 
            c("저체중","정상","과체중","비만"))
table(cut1)  
  
# 숫자를 범주화시키는 두번째 방법
cat1 = ifelse(diet2$BMI<18.5,"저체중",
       ifelse(diet2$BMI<23,"정상",
              ifelse(diet2$BMI<25,"과체중","비만")))
table(cat1)                     

weekdays(as.Date("2022-06-27"))

mtcars              
boxplot(mpg~gear, mtcars)
mtcars %>% 
  filter(gear==3) -> gear3
mtcars %>% 
  filter(gear==4) -> gear4
mtcars %>% 
  filter(gear==5) -> gear5
mean(gear3$mpg)
mean(gear4$mpg)
mean(gear5$mpg)
head(mtcars)

boxplot(mpg~cyl, mtcars)
mtcars %>% 
  group_by(cyl) %>% 
  summarise(표본=n(), 평균=mean(mpg), 표준편차=sd(mpg))

# diet
head(diet)
## 1. diff = 사전몸무게 - 6주후 몸무게 
### mutate 
diet %>% 
  mutate(diff = pre.weight- weight6weeks) -> diet2

boxplot(diff~Diet, diet2)

diet2 %>% 
  group_by(Diet) %>% 
  summarise(표본=n(), 평균=mean(diff), 표준편차=sd(diff)) -> result1

result1 %>% 
  mutate(비율=round(표본/sum(표본)*100,1)) %>% 
  dplyr::select(Diet, 표본, 비율, 평균, 표준편차)

diet %>% 
  left_join(result1, by="Diet")

aov(diff~Diet, diet2) %>% summary



## 2. 다이어트 프로그램(3) 간 효과차이가 있는지 요약정리
### group_by, summarise(n(),mean, sd)







