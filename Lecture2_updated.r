
2+3

2*3

log(4)    # Natural log

exp(2)

2e3

2^3; 8^(1/3)

sqrt(4)

x <- 5; x

no.students <- count.students <- 21
# both no.students and count.students are set to 21
course = "EPIB 613"
"Yi" -> me           #  <- , = and -> are equivalent
cat(c(me, "teaches", no.students, "students in", course))
# Don't worry about cat(). If you do, run ?cat in R.

no.students <- 21 # Is this line redundant? why?
hated.Yi.and.left <- 3
no.stay <- no.students - hated.Yi.and.left
print(no.stay)

cat(c(me, "teaches the", no.stay, "smartest students in", course))
# All students in EPIB 613 are smart!!!!!

Course <- "EPIB 601"
course

print(no.students)

no.students <- no.stay
print(no.students)

number <- c(1, 2, 3)
class(number)

letters <- letters[1:3]; print(letters)
class(letters)

logical <- c(TRUE, FALSE)
class(logical)

factor <- as.factor(letters[1:3]); print(factor)
class(factor)

x <- 5; x

snow.days.per.week.mtl <- c(7, 7, 7, 7)
print(snow.days.per.week.mtl)

# We can add names to the vector for each entry
names(snow.days.per.week.mtl) <- rep("Jan 2018", 4)
print(snow.days.per.week.mtl)

# But the names will not affect calculations.
sum(snow.days.per.week.mtl)

mymatrix1 <- matrix(c(3:14), nrow = 4, byrow = TRUE)
print(mymatrix1)

mymatrix2 <- matrix(c(3:14), nrow = 4, byrow = FALSE)
print(mymatrix2)

rownames <- c("row1", "row2", "row3", "row4")
colnames <- c("col1", "col2", "col3")
rownames(mymatrix1) <- rownames
colnames(mymatrix1) <- colnames
print(mymatrix1)

myarray <- array(c(mymatrix1, mymatrix2), dim = c(4,3,2))
print(myarray)

# Don't worry about the data generating process.
set.seed(613) # Make random numbers generated from sample() reproducible.
# Randomly assign ~20% of patients to have disease.
disease <- sample(c(0,1), size = 100, replace = TRUE, prob = c(0.2, 0.8))
# Randomly assign ~40% of patients to take drug.
drug <- sample(c(0,1), size = 100, replace = TRUE, prob = c(0.4, 0.6))
bmi.cat <- sample(1:3, size = 100, replace = TRUE) # Randomly assign BMI categories
age.cat <- sample(1:4, size = 100, replace = TRUE) # Randomly assign age categories
data <- data.frame(drug, disease, bmi.cat, age.cat) # Make our data frame
head(data)

# The table below shows the first 6 rows of the fake dataset.
# This is a typical dataset you will see in Epidemiology.
# Each row is a patient, with their own information.
# Goal is to assess the association between disease and drug (drug safety).

# By tabulating the data, we can assess the association (EPIB 601 material).
# If we only tabulate drug and disease, we get a 2x2 table, which is a matrix or a 2-dimensional array.
# 1st dimension: drug, 2nd dimension: disease
table(data[c("drug","disease")])

# This may not be enough, we want to see how people with different BMI may differ (confounder, also 601 material).
# We now need a 2x2x3 table, which is a 3-dimensional array.
# 1st dimension: drug, 2nd dimension: disease, 3rd dimension: bmi.cat
table(data[c("drug", "disease", "bmi.cat")])

# Further include age to see how age category comes into the association
# We now need a 2x2x3x4 table, which is a 4-dimensional array.
# 1st dimension: drug, 2nd dimension: disease, 3rd dimension: bmi.cat, 4th dimension: age.cat
table(data)

names <- c("Lucy", "John", "Mark", "Candy")
score = c(67, 56, 87, 91)
df <- data.frame(names, score); print(df)
curved.score <- sqrt(score)*10
# cbind() and data.frame() work the same when combining a data frame with a new column.
new <- data.frame(df, curved.score)
new1 <- cbind(df, curved.score)
str(new); str(new1)
# Order of columns only matters sometimes (display, tabulation, etc.).
df.order <- data.frame(score, names); print(df.order)
df$names; df.order$names

str(df) # checking the structure of an object

mt <- (cbind(names, score)); print(mt) # cbind() means column bind

is.matrix(mt) # verifying whether 'mt' is a matrix

my.df <- as.data.frame(mymatrix1)
print(my.df)

str(my.df); is.data.frame(my.df)

# Converting a data frame into a matrix
my.mt <- as.matrix(df)
print(my.mt)

str(my.mt)

is.matrix(my.mt); is.data.frame(my.mt)

mylist <- list("Red", factor(c("a","b")), c(21,32,11), TRUE)
print(mylist)

str(mylist)

ch.letter <- letters[1:3]
print(ch.letter)

class(ch.letter)

fac.letter <- as.factor(letters[1:3])
print(fac.letter)
# Note the additional 'Levels: a b c' in the output

class(fac.letter)
# Should factor be considered as an object class or a data type?

c(-1, 5.44, 100, 34123)


-1:10 # By increments of 1.


seq(from = 0.33, to = 9.33, by = 3)


seq(from = 0, to = 1, length = 5)


rep(1.2, times = 5)


rep(c("six", "one", "three"), times = 2)


c(6, 1, 3, rep(seq(from = 3, to = 5, by = 0.5), times = 2))


sequence(5)

sequence(c(6, 1, 3))

a <- c(1, 8, 8)
b <- c(2, 8, 4)

a+1 # here 1 is considered as a vector (1, 1, 1)

a+b

a*b

a^2

c <- matrix(c(1,2,3,4), nrow = 2, byrow = T)
d <- matrix(c(5,6,7,8), nrow = 2, byrow = F)
print(c); print(d)

c+1

c+d

c*d

c^2

a %*% b

a %o% b

c %*% d

c; t(c)

diag(c)

det(c)

# Recall vector a and b from above.
print(a); print(b)

a == b # Equal or not?

a != b # Not equal?

a > b

a <= b

# And
a; b
a>5 & b>5

# Or
a>=5 | b>=5

"ABC" == "ABC"

"ABC" == "abc"

TRUE + TRUE + FALSE # True = 1, False = 0.
