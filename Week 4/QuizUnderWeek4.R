# Question 1:
# Where did I get confused?
# I thought that we are comparing variances of two models (Null and Full) here.
# I correctly found degrees of freedom for Full model - n - p
# But I am not sure what should be degrees of freedom for null model. Should it be n - 1 (since there is only one coefficient) 
# or p - 1 (As per ANOVA table) - Why? Ask this to instructor.

# Formula for F in MLR is same as formula of r-squared in SLR.
f = 2.4
n = 30
p = 9 + 1 # number of coefficients
df1 = p - 1 # As per ANOVA table.
df2 = n - p
pf(q = f, df1, df2, lower.tail = FALSE)

# Question 2:
p = 5 + 1 # number of coefficients
n = 20
q = -1.3

# Doing abs and lower.tail = FALSE for consistency.
# Multiplying by 2 because t-test is 2-way test.
2 * pt(q = abs(q), df = n - p, lower.tail = FALSE)

# Question 3: Discuss
# We need to find covar matrix "C" to answer this question. Since we do not have data. We will have to do simulation.
# This totally depends on data. Which means sd can keep changing with data? There is no fix SD of coefficients.
set.seed(42)
n = 15
x = data.frame(
  x0 = rep(1, n),
  x1 = runif(n),
  x2 = runif(n),
  x3 = runif(n)
)

x = data.matrix(x)
C = solve(t(x) %*% x)
C22 = C[3, 3]

s = sqrt(9)
sd = s * sqrt(C22)
sd

# Question 4:
model = lm(Fertility ~ ., data = swiss)
d = data.frame(Agriculture = 54, Examination = 23, Education = 13, Catholic = 60, Infant.Mortality = 24)
predict(model, newdata = d)

# Question 5:
# There is no prediction interval for coefficients.
model = lm(Fertility ~ ., data = swiss)
confint(model, level = 0.99, parm = "Catholic")[2]

# Question 6:
# We can get this directly from the model summary
# We could calculate these by finding estimate of beta_ and standard error as well [t-val = E[beta]/ SE[beta]]
model = lm(Fertility ~ ., data = swiss)
summary(model)$coefficients["Examination", "Pr(>|t|)"]

# Question 7:

# We are asked to find confidence interval of response - therefore using predict.
model = lm(Fertility ~ ., data = swiss)
d = data.frame(Agriculture = 40, Examination = 28, Education = 10, Catholic = 42, Infant.Mortality = 27)
predict(model, newdata = d, level = 0.95, interval = c("confidence"))[1, "lwr"]

# Question 8:

# We are asked to find prediction interval of response - therefore using predict.
model = lm(Fertility ~ ., data = swiss)
d = data.frame(Agriculture = 40, Examination = 28, Education = 10, Catholic = 42, Infant.Mortality = 27)
predict(model, newdata = d, level = 0.95, interval = c("prediction"))[1, "lwr"]

# Question 9:

model = lm(Fertility ~ ., data = swiss)
summary(model)$f["value"]

# Question 10:

# Since this is a muli linear regression, we cannot conclude significance of regression by looking at coefficients.
# Model level p-value is present in the summary. How do we extract that?
alpha = 0.01
model = lm(Fertility ~ ., data = swiss)
pval = pf(summary(model)$f["value"], df1 = summary(model)$f["numdf"], df2 = summary(model)$f["dendf"], lower.tail = FALSE)
ifelse(pval < alpha, "Fail to reject", "reject")

# Question 11:

fullmodel = lm(Fertility ~ ., data = swiss)
partmodel = lm(Fertility ~ Education + Catholic + Infant.Mortality, data = swiss)
an = anova(partmodel, fullmodel)
an$`Pr(>F)`[2]

# Question 12:

# Larger model will always have larger R^2

# Question 13:

# p-value can be calculated using t-value
# t-value = estimate of beta_hat_i / StdError[beta_hat_i]
# StdError[beta_hat_i] = StdErrorOfModel * sqrt(Cjj)
# we do not know std error of model and we do not have data to find Cjj
# Therefore there is not enough information.

#Another thought:
# We could have simulated some data
# By doing this, we would have got Cjj
# But we still need StdErrorOfModel. This can be derived if we know actual values of y and fitted values of y.
# We do not have actual values since we do not have an actual sample.
# We cannot have fitted values because we do not have beta_0
# Therefore not enough information.

# Question 14:

# Not enough information. We should not assume distribution properties if data is not given to us.

# Question 15:

# Guess: probability of either beta_0 or beta_1 being zero will be more than probability of "both of them being zero" (p-value of model)
# IMO answer should be less than 0.01
# But actual answer was more than 0.01
