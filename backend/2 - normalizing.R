library(dplyr)
library(caret)
set.seed(123)


# Loading data
data_red <- read.csv("./databases/winequality-red-balanced.csv",
                     sep = ",")
data_white <- read.csv("./databases/winequality-white-balanced.csv",
                       sep = ",")

# Splitting the data in the class to be predicted and the features
class_red <- as.factor(data_red$quality)
class_white <- as.factor(data_white$quality)

data_red <- data_red %>%
  select(-quality)
data_white <- data_white %>%
  select(-quality)

# Normalizing the data with min-max scaler
# ref: https://www.digitalocean.com/community/tutorials/normalize-data-in-r
process_red <- preProcess(data_red, method = "range")
data_red_norm <- predict(process_red, data_red)

process_white <- preProcess(data_white, method = "range")
data_white_norm <- predict(process_white, data_white)

# Putting the class back in the data for the training
data_red_norm <- data_red_norm %>%
  mutate(quality = class_red)

data_white_norm <- data_white_norm %>%
  mutate(quality = class_white)

# Saving the normalized data
write.csv(data_red_norm,
          "./databases/winequality-red-balanced-norm.csv",
          row.names = FALSE)
write.csv(data_white_norm,
          "./databases/winequality-white-balanced-norm.csv",
          row.names = FALSE)

cat("\nDone")

