install.packages("foreign") # foreign 패키지 설치
install.packages("dplyr") # foreign 패키지 설치
install.packages("ggplot2") # foreign 패키지 설치
library(foreign) # SPSS 파일 로드
library(dplyr) # 전처리
library(ggplot2) # 시각화

setwd("F:/intermediate3-master/데이터")
# 데이터 불러오기
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)
# 복사본 만들기
welfare <- raw_welfare

dim(welfare)
head(welfare)

welfare <- rename(welfare,
                  gender = h10_g3, # 성별
                  birth = h10_g4, # 태어난 연도
                  marriage = h10_g10, # 혼인 상태
                  religion = h10_g11, # 종교
                  income = p1002_8aq1, # 월급
                  code_job = h10_eco9, # 직종 코드
                  code_region = h10_reg7) # 지역 코드

welfare2 <- welfare %>% 
  select(gender, birth, marriage, religion, income, 
         code_job, code_region)
head(welfare2)  








