# Loading data
data_red <- read.csv("./bases-de-dados/winequality-red-balanced.csv",
                     sep = ",")
data_white <- read.csv("./bases-de-dados/winequality-white-balanced.csv",
                       sep = ",")

if (all(data_red$quality == data_red$Class) &&
      all(data_white$quality == data_white$Class)) {
  print("The columns are equal")
  data_red$Class <- NULL
  data_white$Class <- NULL
} else {
  print("The columns are different")
}

# Normalizing the data
data_red_norm <- scale(data_red)
data_white_norm <- scale(data_white)