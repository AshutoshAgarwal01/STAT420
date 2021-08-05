# 1
pf(2.7, 3, 5)

# 2
model = lm(Employed ~ GNP + Population + Armed.Forces, data = longley)
confint(model, interval = c("confidence"), parm = "GNP", level = 0.9)[1]

# 3
model = lm(Employed ~ GNP + Population + Armed.Forces, data = longley)
summary(model)$coef["Population", "Std. Error"]

# 4
model = lm(Employed ~ GNP + Population + Armed.Forces, data = longley)
summary(model)$coef["Armed.Forces", "Pr(>|t|)"]

# 5
model = lm(Employed ~ GNP + Population + Armed.Forces, data = longley)
summary(model)$f["value"]