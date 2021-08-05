# Questions 1
# Consider a random variable X that has a t distribution with 5 degrees of freedom. Calculate P[|X| > 2.1]

# Answer1: This is just for explaining in detail.
# When we say |x| > 2.1 we want to calculate area under t-distribution that lies after 2.1 and before -2.1
areaAboveThr = pt(q = 2.1, df = 5, lower.tail = FALSE)
areaUnderThr = pt(q = -2.1, df = 5, lower.tail = TRUE)
areaAboveThr + areaUnderThr

# Answer 2: Since t-distribution is symmetric, we do not need to find both areas explicitly. We can simply double any one of them to get answer
2 * pt(q = 2.1, df = 5, lower.tail = FALSE)

# or 
2 * pt(q = -2.1, df = 5, lower.tail = TRUE)


# Answer 3: Without using lower.Tail
# Default parameter is lower.Tail = True. Therefore, we will get entire area from negative infinity to this point.
# now depending on what is the value of q (positive or negative), we will need to change the approach

# if q is negative:
2 * pt(q = -2.1, df = 5)

# if q is positive: In this case we will get area which includes center part as well that we do not want.
2 * (1 - pt(q = 2.1, df = 5))

#Verdict: Always use abs value to avoid any confusion. Because abs will always be positive.
2 * pt(q = abs(2.1), df = 5, lower.tail = FALSE)

# Question 2