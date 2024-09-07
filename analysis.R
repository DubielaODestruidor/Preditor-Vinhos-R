library(dplyr)
library(randomForest)
library(caret)
set.seed(123)

# Loading the models
# NOTE: Models cannot be attributed to variables in R
load("./models/rf_red.RData")
load("./models/rf_white.RData")

# Showing the models
print(rf_red)
print(rf_white)

# Visualizing the importance of each characteristic
varImpPlot(rf_red)
varImpPlot(rf_white)

# Making predictions
# predict ref: https://www.rdocumentation.org/packages/randomForest/versions/4.7-1.1/topics/predict.randomForest
data_red <- read.csv("./databases/winequality-red-balanced-norm.csv",
                     sep = ",")
data_red <- data_red %>%
  mutate(quality = as.factor(quality))
predictions_red <- predict(rf_red, data_red) %>%
  trunc() %>% # Rounding to keep the factor levels equal data_red$quality
  as.factor()

data_white <- read.csv("./databases/winequality-white-balanced-norm.csv",
                       sep = ",")
data_white <- data_white %>%
  mutate(quality = as.factor(quality))
predictions_white <- predict(rf_white, data_white) %>%
  trunc() %>%
  as.factor()

# Confusion matrix
cat("Red wine confusion matrix\n")
print(confusionMatrix(predictions_red, data_red$quality))
cat("---------------------------------------------\n")

cat("White wine confusion matrix\n")
print(confusionMatrix(predictions_white, data_white$quality))
cat("---------------------------------------------\n")