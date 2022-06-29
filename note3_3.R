# 연령대에 따른 월급 차이
head(welfare2)

welfare2 %>% 
  mutate(age=2015-birth) %>% 
  # mutate(age.g = cut(age, c(0,20,30,40,50,60,110))) %>% head
  mutate(age.g=floor(age/10)) -> welfare3

# 1. 연령대별 월급 시각화
boxplot(income~age.g, welfare3)

# 2. 요약값 생성
welfare3 %>% 
  group_by(age.g) %>% 
  summarise(n=n(), mean=mean(income, na.rm=T),
            sd=sd(income, na.rm=T)) -> result2

# 3. 통계모형 (일원배치분산분석) : 이분산성 
bartlett.test(income~age.g, welfare3)
oneway.test(income~age.g, welfare3)

# 4. 시각화
library(plotly)
result2 %>% ggplot(aes(x=factor(age.g), y=mean,
                       fill=factor(age.g)))+geom_col()+
            geom_errorbar(aes(ymin=mean-sd,
                              ymax=mean+sd),
                          width=0.2)+theme_classic() -> a
ggplotly(a)






