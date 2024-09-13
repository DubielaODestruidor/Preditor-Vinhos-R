library(dplyr)
library(randomForest)
library(caret)
set.seed(123)


cat("Red wine:\n")
# Loading the model
load("./models/rf_red.RData")
# Showing the model
print(rf_red)
# Visualizing the importance of each characteristic
varImpPlot(rf_red)
# Making predictions
# predict ref: https://www.rdocumentation.org/packages/randomForest/versions/4.7-1.1/topics/predict.randomForest
data_red <- read.csv("./databases/winequality-red-balanced-norm.csv",
                     sep = ",")
data_red <- data_red %>%
  mutate(quality = as.factor(quality))
predictions_red <- predict(rf_red, data_red) %>%
  trunc() %>% # Rounding to keep the factor levels equal data_red$quality
  as.factor()
# Confusion matrix
print(confusionMatrix(predictions_red, data_red$quality))
cat("---------------------------------------------\n")


# Doing the same for the white wine model
cat("White wine:\n")

load("./models/rf_white.RData")

print(rf_white)

varImpPlot(rf_white)

data_white <- read.csv("./databases/winequality-white-balanced-norm.csv",
                       sep = ",")
data_white <- data_white %>%
  mutate(quality = as.factor(quality))
predictions_white <- predict(rf_white, data_white) %>%
  trunc() %>%
  as.factor()

print(confusionMatrix(predictions_white, data_white$quality))
cat("---------------------------------------------\n")
