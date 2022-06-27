# Import
자료불러오기
csv : read.csv
school <- read.csv("C:/Users/USER/Desktop/intermediate1-main/1. 학교기본정보(전체).csv")
head(school)
# 1. 시도교육청별 학교 수는?
school$시도교육청 %>% table %>% sort %>% barplot

# 2. 국내의 초등학교, 중학교, 고등학교 숫자?
school %>% 
  filter(학교급코드 %in% c(2,3,4)) %>% 
  group_by(학교급코드) %>% 
  summarise(n=n())

school %>% 
  filter(학교급코드 %in% c(2,3,4)) -> school2
school2$학교급코드 %>% table

# 3. 시도교육청별 초등학교, 중학교, 고등학교 수는?
table(school2$시도교육청)
table(school2$학교급코드)
table(school2$시도교육청, school2$학교급코드) -> tab1
round(tab1/rowSums(tab1)*100,1)

# 4. 시도교육청별로 가장 오래된 초등학교는?
head(school)
table(school$남녀공학구분)
school %>% 
   filter(남녀공학구분=="녀") %>% 
   filter(학교급코드==3) %>% 
  group_by(시도교육청) %>% 
  arrange(설립일) %>% 
  slice_head(n=1) %>% 
  dplyr::select(시도교육청, 학교명, 설립일) %>% 
  data.frame %>% View

table(school$시도교육청, school$설립구분)  

age=2022-as.numeric(substr(school$설립일,1,4))
age

