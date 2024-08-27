# Loading data
data_red <- read.csv("./bases-de-dados/winequality-red.csv", sep = ";")
data_white <- read.csv("./bases-de-dados/winequality-white.csv", sep = ";")

# Checking if the databases era equal
if (all.equal(colnames(data_red), colnames(data_white))) {
  print("The databases have the same columns")
  columns <- colnames(data_red)
  print(columns)
} else {
  print("The databases have different columns")
}

# Checking wine quality of both data.frames
print("Red wine quality ->")
red_quality_quantity <- table(data_red$quality)
red_quality <- data_red$quality
print(red_quality_quantity)
print(red_quality[1:10])

print("White wine quality ->")
white_quality_quantity <- table(data_white$quality)
white_quality <- data_white$quality
print(white_quality_quantity)
print(white_quality[1:10])

# Setting seed for reproducibility of the following analysis
set.seed(123)
