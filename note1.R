# R 4가지 
 
# 1. 객체를 저장해서 활용한다. 
head(mtcars)
mpg.wt = mtcars$mpg/ mtcars$wt
mpg.wt <- mtcars$mpg/ mtcars$wt
mtcars$mpg/ mtcars$wt -> mpg.wt

model1<-lm(mpg~wt, mtcars)
summary(model1)

# 2. 함수
sample(1:45,6) # 임의의 숫자를 생성하는 함수
# 첫번째는 숫자주머니, 두번째는 갯수

sample(1:100,4)

seq(1,1000,6)
# 순열을 따르는 숫자를 생성하는 함수
# 첫번째 : 시작값, 두번째 : 마지막값, 세번째 : 증가량


# 3. 패키지
install.packages("maps")
library(maps)
map('world')

# 4.[, ] 인덱스
원하는 데이터를 추출할 때 사용


