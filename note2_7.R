일변량 
연속형 :  t.test(수치형자료, mu=)/ summary/ hist/ boxplot
범주형 :  binom.test(x=, n=, p=0.7) / table / barplot

이변량 
범주형 * 범주형 : table(범주형, 범주형) %>% chisq.test

범주형 * 연속형 
 1. boxplot(연속형 ~ 범주형, data)
 2. data %>% 
   group_by(범주형) %>% 
   summarise(n=n(), 평균=mean(연속형), 표준편차=sd(연속형))
 3. 검정통계량, 유의확률
   집단 2 : 독립t검정 t.test
   집단 2개 이상 : 일원배치분산분석, aov, oneway.test
 3.1 등분산성 검정 
   2개 var.test()
   3개이상 bartlett.test()
 4. 일원배치분산분석 결과 통계적으로 유의한 결과/
    사후분석
 
연속형 * 연속형
 1. 시각화 # 산점도 plot
 2. 상관계수 # cor, cor.test
 3. 회귀모형 # lm 
    - 정규성, 독립성, 등분산성
    - shapiro.test(), durbinWatsonTest(), ncvTest()
    - influencePlot() # 영향점, 이상점, 지렛점 
 4. 다중회귀모형
    - 독립변수 간 상관성 : 다중공선성문제 : vif()
    - 모형선택 : 수정된 결정계수, Cp, BIC, AIC
 
 
 
 
   