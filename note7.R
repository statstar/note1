# 요약정리 
## R 기본원리 세가지
### 1. ->, <-, = 이용해서 원하는 객체를 저장해서 사용할 수 있다.

### 2. 소괄호() 나오면 함수 
  head() # 자료의 앞 부분
  filter() # 원하는 행 선택
  select() # 원하는 열 선택
  mutate() # 새로운 변수 생성
  group_by(), summarise()
  arrange()
  substr() # 원하는 문자열 추출
  
### 3. package, R의 내장되어 있는 함수 외 함수를 사용할 경우
  
#### 데이터 분석
head(mtcars)  
# 일변량분석
  ## 자료유형 (명목척도, 순서척도, 등간척도, 비율척도)
   # 범주형자료(문자형변수) : 명목척도, 순서척도/ table, barplot
   # 연속형자료(수치형변수) : 등간척도, 비율척도/ summary, hist, boxplot
mtcars$cyl %>% table %>% barplot
hist(mtcars$mpg)
boxplot(mtcars$mpg)
mean(mtcars$mpg)
var(mtcars$mpg)
sd(mtcars$mpg)

# 이변량분석
범주형*범주형
table(mtcars$cyl, mtcars$gear)
table(mtcars$cyl, mtcars$gear) %>% chisq.test
table(mtcars$cyl, mtcars$gear) %>% barplot(,beside=T, 
                                           legend=rownames(.))
범주형*연속형
head(mtcars)
boxplot(mpg~cyl, mtcars)
mtcars %>% 
  group_by(cyl) %>% 
  summarise(n=n(), mean=mean(mpg), sd=sd(mpg))


bartlett.test(mpg~cyl, mtcars)
aov(mpg~cyl, mtcars) # 등분산일때
oneway.test(mpg~cyl, mtcars) # 이분산일때

boxplot(mpg~gear, mtcars)
boxplot(mpg~am, mtcars)

boxplot(mpg~vs, mtcars)
mtcars %>% 
  group_by(vs) %>% 
  summarise(n=n(), mean=mean(mpg), sd=sd(mpg))
var.test(mpg~vs, mtcars)
t.test(mpg~vs, mtcars, var.equal = FALSE)
t.test(mpg~vs, mtcars, var.equal = TRUE)

# 연속형 * 연속형 
plot(mpg~wt, mtcars)
cor.test(mtcars$mpg, mtcars$wt)

mpg = a*wt + b # 회귀분석
lm(mpg~wt, mtcars) %>% summary

# 다변량분석
군집분석
요인분석
다중회귀모형
분류분석
  
