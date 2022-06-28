setwd("F:/intermediate2")
apt1 <-read.csv("apt2020.csv", skip=15, header=T)
apt2 <-read.csv("apt2021.csv", skip=15, header=T) 
apt3 <-read.csv("apt2022.csv", skip=15, header=T) 

head(apt1)
head(apt2)
head(apt3)

t.apt1 <- rbind(apt1, apt2, apt3)

library(dplyr)
out <- strsplit(t.apt1$시군구, split=" ")
region <- do.call(rbind, out) %>% data.frame
names(region)<-c("시","구","동")
t.apt3 <- cbind(t.apt1, region)
View(t.apt3)

t.apt3 %>% 
  mutate(year=substr(계약년월,1,4), mon=substr(계약년월,5,6)) -> t.apt4
head(t.apt4,1)

as.numeric(t.apt4$거래금액.만원.[1])
t.apt4 %>% 
  mutate(price=gsub(",","",`거래금액.만원.`)) %>% 
  mutate(price=as.numeric(price)) -> t.apt5

hist(t.apt5$price)

## 
table(t.apt5$계약년월) %>% barplot

t.apt5 %>% 
  filter(price == max(price))

t.apt5 %>% 
  filter(price >500000) %>% group_by(year) %>% summarise(n=n())

library(clipr)
t.apt5 %>% 
  filter(year==2021) %>% 
  filter(구=="송파구") %>%
  group_by(mon) %>% 
  summarise(n=n(), mean=mean(price), sd=sd(price)) %>% 
  write_clip
