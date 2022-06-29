head(welfare2)

welfare2 %>% mutate(job.g = substr(code_job,1,1)) -> welfare4
# welfare2 %>% mutate(job.g = floor(code_job/100)) 

welfare4
# 직업별 월급 차이

## 1. 시각화
boxplot(income~gender+job.g, welfare4)

## 2. 요약값 
welfare4 %>% 
  group_by(job.g, gender) %>% 
  summarise(n=n(), mean=mean(income, na.rm=T),
            sd=sd(income, na.rm=T)) 
