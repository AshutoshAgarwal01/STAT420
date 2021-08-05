a = list(
  x = c(1,2,3,4),
  y = rep("A", 10)
)

typeof(a) # List
typeof(a[1]) # List
typeof(a[[1]]) # double

str(a) # list
str(a[1]) # list
str(a[[1]]) # num

##########################################

df = data.frame(
  n = c(1, 2, 3, 4),
  name = c("Ashutosh", "Neha", "Pranav", "Anay"),
  works = c(TRUE, TRUE, FALSE, FALSE)
)

# str tells it is data frame.
str(df)

# typeof tells it is list
typeof(df)

nrow(df)
ncol(df)
dim(df)

str(df["name"]) # data frame
str(df[2]) # data frame

str(df$name) # list
str(df[["name"]]) # list
str(df[[2]]) # list

###############################################
# install.packages("mosaicData")
Galton = mosaicData::Galton

# str tells it is data frame.
str(Galton)

# typeof tells it is list
typeof(Galton)

View(Galton)
head(Galton, 2)


############################## TIBBLE ###############################
# Prints same as data frames but subsets differently.
############################## Visuals ##############################
install.packages("ggplot2")
mpg = ggplot2::mpg

View(mpg)
hist(mpg$cty)


