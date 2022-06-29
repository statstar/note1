head(welfare4)

# 성별 직업 빈도
table(welfare4$gender, welfare4$job.g) -> tab1

table(welfare4$gender, welfare4$job.g) %>% 
  barplot(., beside=T, ylim=c(0,1000), 
          col=c("skyblue","orange")) -> tab2
text(tab2, tab1, labels=tab1, pos=3, cex=0.8)
title("직업별 월급(성별)")

ggplot(welfare4 %>% filter(!is.na(job.g)),
       aes(x=job.g, fill=factor(gender)))+
  geom_bar(position=position_dodge())

table(welfare4$gender, welfare4$job.g) %>% chisq.test
