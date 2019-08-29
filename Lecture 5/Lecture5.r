
df <- data.frame(names = c("Lucy", "John", "Mark", "Candy"),
                score = c(67, 56, 87, 91))
for (i in 1:4){
    df$student.no[i] <- paste("student", i)
    df$pass[i] <- ifelse(df$score[i]>=60, TRUE, FALSE)
}
df
str(df)

names(df)

# Recall the indexing system in R
df$names   # Select one variable

# Delete one variable
df.copy <- df
df.copy$names <- NULL
df.copy

df[ , "score"]

str(df[ , "score"])   # 1D vector

df[ , "score", drop = FALSE]
str(df[ , "score", drop = FALSE])   # 4 x 1 data frame
# The argument "drop = FALSE" maintains the original dimension
# The default is true

df[1, ]
str(df[1, ])   # 1 x 4 data frame
# Can we drop a dimension here? Why?

df[ , c("student.no", "score", "pass")]   # Delete variable "names" + reorder columns

# Select rows that passed
df[df$pass == TRUE, ]

# Show the name and score of those who passed except Lucy(s).
df[df$pass == TRUE & df$names != "Lucy", c("names", "score")]

df[df$pass == TRUE & df$names != "Lucy", ]$names

# Delete variable
df[ , -c(1, 2)]   # Delete the 1st and 2nd

# I believe that this used to work, but not anymore.
# df[ , -c("names", "score")]

# Now
drop <- c("names", "score")
df[ , !names(df) %in% drop]

select = c("student.no", "pass")
df[ , names(df) %in% select]

# How does this work?
1 %in% c(1, 3, 5)
"b" %in% c("a", "c", "e")
1:10 %in% c(1, 3, 5)

# "select" argument selects columns
subset(df, select = c("student.no", "pass"))

# Can also delete unwanted columns
subset(df, select = -c(names, score))

# "subset" argument selects rows
# Can apply conditions
subset(df, subset = (score > 80))

# Now use both select and subset arguments to apply conditions
# Select the names of those who passed
subset(df, select = names, subset = (pass == TRUE))

# Show the name and score of those who passed except Lucy(s).
subset(df, select = c(names, score),
       subset = (pass == TRUE & names != "Lucy"))
# Recall logical operators &, | and !

# Show the name and score of those who passed except Lucy(s).
# library(dplyr)

df

new.student <- data.frame(names = "[---]",
                          score = 5,
                          student.no = "student 0",
                          pass = TRUE)
new.student

df.new <- rbind(df, new.student); df.new

new.students <- data.frame(names = c("[---]", "[----]"),
                          score = c(5, 6),
                          student.no = c("student 0", "student 00"),
                          pass = c(TRUE, TRUE))
new.students
df.newnew <- rbind(df, new.students); df.newnew

# Option 1
df.copy$id1 <- 1:4
df.copy

# Option 2
df.copy <- data.frame(df.copy, id2 = 1:4)
df.copy

# Option 3
id3 <- 1:4
cbind(df.copy, id3)

df.a <- df[, -4]
df.b <- df[-2, ]
df.b[2, 3] <- "Student 5"
df.b[2, 2] <- 56
df.b[2, 4] <- F
df.a; df.b

# Identical rows based on common columns
merge(x = df.a, y = df.b, all = FALSE)
# all = False by default

merge(x = df.a, y = df.b, all = TRUE)   # All rows

# All rows based on common score
merge(df.a, df.b, all = TRUE, by = "score")

# Some simple simulation
# People who take the drug, that are obese and that are older are more likely to get the disease.
# Setting seeds make random number generation reproducible.
set.seed(613)
n <- 100
drug <- sample(c(0, 1), size = n, replace = TRUE, prob = c(0.8, 0.2))
obesity <- sample(c(0, 1), size = n, replace = TRUE, prob = c(0.5, 0.5))
age <- round(rnorm(n, mean = 60, sd = 10))
logit.p <- log(1.8)*drug + log(1.05)*(age - 60) + log(1.2)*obesity + log(0.2)
p <- exp(logit.p)/(1 + exp(logit.p))
disease <- rbinom(n, size = 1, prob = p)
sim <- data.frame(drug, obesity, age, disease)
head(sim)

# Tabulate exposure and outcome
table(sim[, c("drug", "disease")])
# 20% among unexposed to the drug and 30% among exposed had the outcome disease.

# Replicate the tabulation
aggregate(sim$disease,
          by = list(drug = sim$drug, disease = sim$disease),
          FUN = length)

# length()
length(1:10)

aggregate(sim$disease,
          by = list(drug = sim$drug,
                    obesity = sim$obesity,
                    disease = sim$disease),
          FUN = length)

# Recall that table() in this case will return a 3D array
table(sim[, c("drug", "obesity", "disease")])

# More tabulation
aggregate(cbind(obesity, disease)~drug, data = sim, sum)

# Mean age in different disease groups
aggregate(age~disease, data = sim, FUN = mean)

aggregate(age~., data = sim, FUN = mean) # . refers to all other variables

aggregate(cbind(age, disease)~drug + obesity, data = sim, FUN = mean)

matrix1 <- matrix(1:6, byrow = TRUE, nrow = 2)
matrix2 <- matrix(7:12, byrow = TRUE, nrow = 2)
vector1 <- 13:15
matrix1
matrix2
vector1

merged.matrix <- rbind(matrix1, matrix2, vector1)
merged.matrix

matrix3 <- matrix(letters[1:6], byrow = TRUE, nrow = 2)
vector2 <- letters[7:8]
matrix3
vector2

cbind(matrix3, vector2)
