일변량
  연속형(수치형) : 일표본 t 검정 : t.test(data, mu=?)
  범주형(문자형) : binom.test

이변량
  범주형 * 연속형 : 독립 t검정 (t.test), 일원배치분산분석(aov, oneway.test)
  범주형 * 범주형 : chisq.test
  연속형 * 연속형

다변량
head(cars)
plot(dist~speed, cars)
library(clipr)
cars %>% write_clip
