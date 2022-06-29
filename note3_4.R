# 연령대 및 성별 월급 차이
head(welfare3)

## 1. 시각화
boxplot(income~ gender+age.g, welfare3, col=c("blue","red"))

ggplot(data=welfare3, aes(x=factor(age.g), y=income, 
                          fill=factor(gender)))+
  geom_boxplot()

## 2. 요약값 생성
welfare3 %>% 
  group_by(age.g, gender) %>% 
  summarise(n=n(), mean=mean(income, na.rm=T),
            sd=sd(income, na.rm=T)) -> result3



result3 %>% filter(gender==1) -> male
result3 %>% filter(gender==2) -> female

merge(male, female, by="age.g") %>% 
  mutate(diff=mean.x-mean.y) %>% 
  select(age.g, diff)
