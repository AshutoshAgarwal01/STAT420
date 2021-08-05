# 1
f = 2.4
n = 30
# p - 1 = 9
p = 10

# pf(f, p - 1, n - p) # Attempt 1 - incorrect
pf(f, p - 1, n - p, lower.tail = FALSE)  # Attempt 2

# 2
n = 20
p = 5 + 1
t = -1.3
# pt(t, n - p) # Attempt 1 - incorrect. In this case we are considering area to the left of -1.3. We need to consider area to the right of 1.3 as well.
2 * pt(abs(t), n - p, lower.tail = FALSE) # Attempt 2

# 3
set.seed(42)
x_values = data.frame(
  x1 = runif(15),
  x2 = runif(15),
  x3 = runif(15)
)

X = data.matrix(x_values) # Converting to data frame.
X = cbind(rep(1, 15), X) # Attempt 2 - this was added.

sigma = sqrt(9)
covmat = solve(t(X) %*% X)
C33 =  covmat[3,3]
sd_beta_2 = sigma * sqrt(C33)
sd_beta_2

# 4
model = lm(Fertility ~ ., data = swiss)
x = data.frame(rbind(c(54, 23, 13, 60, 24)))
colnames(x) = names(model$coefficients)[-1]
predict(model, newdata = x)

# 5
model = lm(Fertility ~ ., data = swiss)
confint(model, parm = "Catholic", interval = c("confidence"), level = 0.99)[2]

# 6
model = lm(Fertility ~ ., data = swiss)
summary(model)$coef["Examination", "Pr(>|t|)"]

# 7 - incomplete
model = lm(Fertility ~ ., data = swiss)
x = data.frame(rbind(c(40, 28, 10, 42, 27)))
colnames(x) = names(model$coefficients)[-1]
predict(model, newdata = x, level = 0.95, interval = c("confidence"))[2]

# 8
model = lm(Fertility ~ ., data = swiss)
x = data.frame(rbind(c(40, 28, 10, 42, 27)))
colnames(x) = names(model$coefficients)[-1]
predict(model, newdata = x, level = 0.95, interval = c("prediction"))[2]


# 9
model = lm(Fertility ~ ., data = swiss)
summary(model)$f["value"]

# 10
model = lm(Fertility ~ ., data = swiss)
f = summary(model)$f
alpha = 0.01
p_val = pf(f["value"], f["numdf"], f["dendf"], lower.tail = FALSE)
ifelse(p_val < 0.01, "Reject Null hypothesis", "Fail to reject null hypothesis")

# 11
partModel = lm(Fertility ~ Education + Catholic + Infant.Mortality, data = swiss)
fullModel = lm(Fertility ~ ., data = swiss)
anova(partModel, fullModel)[2, "Pr(>F)"]

# 12
# The model with an R^2 of 0.8

# 13
# Attempt 1 # incorrect
# Answer: p-value for testing H_0: beta_1 = 0 will be larger than p-value for testing H_0 for beta_2 = 0

# lets say the model is mpg ~ wt + year
# beta_1 = 5 and beta_2 = 0.25
# We can try to prove it by considering what would happen if  beta_2 is extremely small
# In that case, if we set beta_1 to zero then under null hypothesis we say "There is no significant linear relationship between mpg and year 
# given wt is not considered"
# Since beta_2 is negligible - there will be high chance of "failed to reject null hyp" therefore we can say that p-value will be larger than other case.

# Attempt 2 # Correct
# Section 9.2.1 of book - 
# t-value = beta_hat_j / (s_e * sqrt(Cjj))
# We know that p-value decreases as t-value increases.
# There are two variables in t-value => beta_hat_j and Cjj
# However we have info about only numerator.
# We need values of X to find Cjj. Therefore we cannot say what will happen with p-values
# Answer: Not enough information.

# 14 ?
# Attempt 1 # incorrect
# Different but positive.
# This is because there is positive relationship between height and age as well.
# In case of mpg ~ wt + year it will be negative because there is negative relationship between these two
# incorrect

# Attempt 2 # incorrect
# Zero - For a person of a particular age. IQ remains constant regardless of height.
# This is because IQ is determined by age not by height.
# Since height increases by age, if we do not include age in the model - it will indicate that IQ increases by height.
# Height was a hidden variable.
# Remember example of ice cream sales on beach vs robberies.

# Attempt 3 # Correct
# None of above - We do not know anything about relationship between age and IQ. Therefore answer can be any value.

# 15
# Attempt 1 - Incorrect
# Op1: The p-values for both will be less than 0.01

# Attempt 2 # incorrect
# Op3: H_0 (beta_1 = 0) will have a p-value less than 0.01 if H_0 (beta_2 = 0) has a p-value greater than 0.01

# Attempt 3
# op2 : p-values for both could be greater than 0.01