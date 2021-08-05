# 14 and 15 were incorrect.

set.seed(43)
n = 250
mean = 3
var = 11
sd = sqrt(var)
data = rnorm(n = 250, mean = 3, sd = sqrt(11))
mean(data > 4)

# Q2
some_fun = function(arg1 = 2, arg2 = 1){
  mean(arg2) * arg1
}

(some_fun() + some_fun(arg1 = 3, arg2 = 1:10)) / some_fun(arg1 = 5, arg2 = 1:5)

# Q3
# What proportion of the variance of Sepal.Length is explained by a linear relationship with Sepal.Width?
model = lm(Sepal.Length ~ Sepal.Width, data = iris)
summary(model)$r.squared

# Q4
model = lm(circumference ~ age, data = Orange)
range(Orange$age)
ndata = data.frame(age = c(600, 2500))
predict(model, newdata = ndata)

# ans: 284.32546

# Q5

model = lm(circumference ~ age, data = Orange)
# summary(model)
confint(model, parm = "age", level = 0.9)[1]

# Q6

model = lm(circumference ~ age, data = Orange)
ndata = data.frame(age = c(250))
predict(model, newdata = ndata, level = 0.9, interval = c("confidence"))[1, "lwr"]

# Q7

model = lm(circumference ~ age, data = Orange)
ndata = data.frame(age = c(400))
predict(model, newdata = ndata, level = 0.99, interval = c("prediction"))[1, "upr"]

# Q8

model = lm(circumference ~ age, data = Orange)
beta_1_hat = summary(model)$coefficients["age", "Estimate"]
beta_1 = 0.125
SE_beta_1_hat = summary(model)$coefficients["age", "Std. Error"]
t = (beta_1_hat - beta_1) / SE_beta_1_hat
2 * pt(q = abs(t), df = nrow(Orange) - 2, lower.tail = FALSE)

# Q9

# mean of the model at given data point
mean = 2

# variance of model at given data point (same as entire model)
var = 4
sd = sqrt(var)

# lower.tail = true because less than 3
pnorm(q = 3, mean = mean, sd = sd, lower.tail = TRUE)


# Q10

mean = 2 + 1.5 * 1 -2.1 * 2 + 3.2 * 3

var = 4
sd = sqrt(var)

# lower.tail = false because greater than 11
pnorm(q = 11, mean = mean, sd = sd, lower.tail = FALSE)


# Q11

set.seed(420)
x_values = data.frame(
  x1 = rnorm(15),
  x2 = runif(15),
  x3 = runif(15),
  x4 = runif(15)
)

# adding a col with all ones
x_values = cbind(x0 = rep(1,15), x_values)

# convert to matrix
x_values = data.matrix(x_values)

# find C matrix
C = solve(t(x_values) %*% x_values)

# since we are looking for beta_1, we find C22
C22 = C[2,2]

var = 25

# result
sqrt(var) * sqrt(C22)

# Q12 - Review

p = 4 + 1
n = 15
abs(qt(p = 0.95, df = n-p, lower.tail = FALSE))

# Q13

# What proportion of the median home value (medv) is explained by a linear relationship with the average number of rooms per dwelling and the full-value property-tax rate per $10,000?

model = lm(medv ~ rm + tax, data = Boston)
summary(model)$r.squared


# Q14

model = lm(medv ~ lstat + rm + crim + tax + nox, data = Boston)
summary(model)$coefficients["crim", "Pr(>|t|)"]

# Q 15

fullmodel = lm(medv ~ lstat + rm + crim + tax + nox, data = Boston)
nullmodel = lm(medv ~ lstat + rm, data = Boston)

anova(nullmodel, fullmodel)

# alpha = 0.05
# P-val = 0.0002968
# we reject null hyp (or null model)
# therefore fullmodel is preferred.


(summary(fullmodel)$sigma)^2













