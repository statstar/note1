# 성별에 따라 월급이 다를까?
head(welfare2)
table(welfare2$gender)
summary(welfare2$income)
hist(welfare2$income)

# 1. 시각화를 이용한 데이터 탐색
boxplot(income~gender, welfare2)
ggplot(data=welfare2, aes(x=factor(gender), y=income,
                          fill=factor(gender)))+
  geom_violin()

# 2. 성별 월급 요약갑 생성하기
welfare2 %>% 
  group_by(gender) %>% 
  summarise(n=n(), mean=mean(income, na.rm=T), 
            sd=sd(income, na.rm=T)) -> result1

# 3. 통계모형 (독립 t 검정)  
var.test(income~gender, welfare2)
  ## p-value < 2.2e-16 # 등분산성을 만족하지 않음
t.test(income~gender, welfare2, var.equal=F)

# 4. 시각화
result1
ggplot(data=result1, aes(x=factor(gender), y=mean, 
                         fill=factor(gender)))+
  geom_col()
