library(MASS)

set.seed(3)

mu = c(0,0)
Sigma = matrix(.9, nrow=2, ncol=2) + diag(2) + .1

dat = mvrnorm(n=500, mu=mu, Sigma=Sigma)

dat = data.frame(y = dat[,1], x1 = dat[,2])

dat$y2 = dat$y

dat$y2[sample(1:500, 100, replace=FALSE)] = NA

fit_imp = lm(y2 ~ x1, dat)
preds = predict(fit_imp, newdata=data.frame(x1=dat$x1))
dat$y2[is.na(dat$y2)] = preds[is.na(dat$y2)]

fit1 = lm(y ~ x1, dat)
fit2 = lm(y2 ~ x1, dat)

summary(fit1)
summary(fit2)
