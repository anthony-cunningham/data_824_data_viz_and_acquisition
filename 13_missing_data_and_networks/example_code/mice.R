library(MASS)
library(mice)

#https://www.rdocumentation.org/packages/mice/versions/3.13.0/topics/mice

set.seed(3)

mu = c(0,0)
Sigma = matrix(.9, nrow=2, ncol=2) + diag(2) + .1

dat = mvrnorm(n=500, mu=mu, Sigma=Sigma)

dat = data.frame(y = dat[,1], x1 = dat[,2])

dat$y2 = dat$y

dat$y2[sample(1:500, 100, replace=FALSE)] = NA

md.pattern(dat)

imp = mice(dat[,2:3], m=5, method="pmm", seed=3)

fit = with(data=imp, lm(y2 ~ x1))
combine = pool(fit)
summary(combine)
