# 1
pt(q = 2.1, df = 5, lower.tail = FALSE)

# 2
qt(p = 0.05, df = 8, lower.tail = FALSE)

# 3
beta_1 = 4
var = 4
Sxx = 1.5

# Mean and std of dist of beta hat
# mean will be equal to beta_1
std = sqrt(var / Sxx)
pnorm(q = 4.2, mean = beta_1, sd = std, lower.tail = FALSE)

# 4
faithful_model = lm(eruptions ~ waiting, data = faithful)
summary(faithful_model)$coefficients["waiting", "Std. Error"]

#5
faithful_model = lm(eruptions ~ waiting, data = faithful)
summary(faithful_model)$coefficients["(Intercept)", "t value"]

#6
faithful_model = lm(eruptions ~ waiting, data = faithful)
summary(faithful_model)$coefficients["waiting", "t value"]

#7 ???
faithful_model = lm(eruptions ~ waiting, data = faithful)
confint(object = faithful_model, parm = "waiting", level = 0.99)

# 8
faithful_model = lm(eruptions ~ waiting, data = faithful)
confint(object = faithful_model, parm = "(Intercept)", level = 0.90)[2]

# 9
faithful_model = lm(eruptions ~ waiting, data = faithful)
cInt = confint(object = faithful_model, parm = "waiting", level = 0.95)
cInt[2] - cInt[1]

#10
faithful_model = lm(eruptions ~ waiting, data = faithful)
d = data.frame(waiting = 81)
predict(faithful_model, newdata = d, interval = c("confidence"), level = 0.90)[1,"lwr"]

#11
faithful_model = lm(eruptions ~ waiting, data = faithful)
d = data.frame(waiting = 72)
predict(faithful_model, newdata = d, interval = c("prediction"), level = 0.99)[1,"upr"]

#12
Confidence Interval

#13
