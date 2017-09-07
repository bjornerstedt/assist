library(assist)
df <- tibble(
a = rnorm(10),
b = rnorm(10),

 c = rep("xxx", 10),
 d = as.factor(rep("xxx", 10)),
  e = rep(TRUE, 10)
)
df$b[10] = NA

df2 = describe(df)

df2
