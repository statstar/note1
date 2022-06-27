# Tidyverse
library(dplyr)

## Tidyverse 문법 
head(diet)
diet %>% head # %>% "Ctrl+Shift+M"

head(diet)
diet %>% 
  filter(gender == 0) -> female
diet %>% 
  filter(gender == 1) -> male

mean(female$Height)
mean(male$Height)
mean(female$Age)
mean(male$Age)

diet %>% filter(gender == 0, Height>175)
diet %>% filter(gender == 0 & Height>175)
diet %>% filter(gender == 0) %>% filter(Height>175)

diet %>% filter(Height>190 | pre.weight>80)
diet %>% filter(Age == 20 | Age == 30 | Age==40 | Age==50)
diet %>% filter(Age %in% c(20,30,40,50))
