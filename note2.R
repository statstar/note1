library(readxl)
diet <- read_excel("F:/intermediate1-main/diet.xlsx")


diet <- read.csv("F:/intermediate1-main/diet.csv")

temp = read.table("clipboard", fill=T)

# import 자료를 불러오기
## 1. Rstudio > Environment < Import Dataset 
  # 경로나 파일명이 한글이면 오류가 발생할 수 있음
  # 경로나 파일명을 영문으로 변경
  # Tip. 콘솔창에 코드가 실행되므로 복사에서 재활용하자!

## 2. 코드를 이용해서 파일 불러오기
 csv : read.csv() 
 xlsx : read_excel()
 
## 3. 데이터가 크지 않다면 클립보드를 이용
 data <- read.table("clipbard")
 
 
 head(diet, 10) # 데이터의 앞부분
 tail(diet,2)   # 데이터의 뒷부분
 dim(diet) # 데이터의 차원을 확인
 nrow(diet)
 ncol(diet)
 str(diet)
 summary(diet)
 View(diet)
 
 




