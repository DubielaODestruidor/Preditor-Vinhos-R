library(randomForest)
set.seed(123)


# Loading data
data_red <- read.csv("./databases/winequality-red-balanced-norm.csv",
                     sep = ",")
data_white <- read.csv("./databases/winequality-white-balanced-norm.csv",
                       sep = ",")

# Random Forest training
# ref: https://www.rdocumentation.org/packages/randomForest/versions/4.7-1.1/topics/randomForest
red_training_time <- system.time({
  rf_red <- randomForest(quality ~ .,
                         data = data_red,
                         ntree = 1000,
                         do.trace = 100)
})
cat("Red training time: ", red_training_time["elapsed"], "seconds",  "\n")

white_training_time <- system.time({
  rf_white <- randomForest(quality ~ .,
                           data = data_white,
                           ntree = 600,
                           do.trace = 100)
})
cat("White training time: ", white_training_time["elapsed"], "seconds",  "\n")


# Saving the models
save(rf_red, file = "./models/rf_red.RData")
save(rf_white, file = "./models/rf_white.RData")
