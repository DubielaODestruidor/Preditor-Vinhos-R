library(dplyr)
library(caret)
set.seed(123)


# Loading data
data_red <- read.csv("./databases/winequality-red.csv",
                     sep = ";")
data_white <- read.csv("./databases/winequality-white.csv",
                       sep = ";")

# Getting the quantity of each class (quality)
data_red <- data_red %>%
  mutate(quality = as.factor(quality))
cat("\nClass distribution in data_red:")
print(table(data_red$quality))
cat("---------------------- \n")

data_white <- data_white %>%
  mutate(quality = as.factor(quality))
cat("\nClass distribution in data_white:")
print(table(data_white$quality))
cat("---------------------- \n")

# Balancing the data
# ref: https://search.r-project.org/CRAN/refmans/caret/html/downSample.html
data_red_balanced <- upSample(
  x = data_red,
  y = data_red$quality
)

data_white_balanced <- upSample(
  x = data_white,
  y = data_white$quality
)

cat("\nBalanced data_red:")
print(table(data_red_balanced$quality))
cat("---------------------- \n")

cat("\nBalanced data_white")
print(table(data_white_balanced$quality))
cat("---------------------- \n \n")

# Dropping the column "Class" created by the upSample function
data_red_balanced <- data_red_balanced %>%
  select(-Class)
data_white_balanced <- data_white_balanced %>%
  select(-Class)

# Saving the balanced data
write.csv(data_red_balanced,
          "./databases/winequality-red-balanced.csv",
          row.names = FALSE)
write.csv(data_white_balanced,
          "./databases/winequality-white-balanced.csv",
          row.names = FALSE)
