library(randomForest)
set.seed(123)

# Loading data
data_red <- read.csv("./databases/winequality-red-balanced-norm.csv",
                     sep = ",")
data_white <- read.csv("./databases/winequality-white-balanced-norm.csv",
                       sep = ",")

# Random Forest training
# ref: https://www.listendata.com/2014/11/random-forest-with-r.html#decision-tree-vs-random-forest
red_training_time <- system.time({
  rf_red <- randomForest(quality ~ ., data = data_red, ntree = 1000)
})
cat("--------rf_red--------")
print(rf_red)
cat("Red training time: ", red_training_time["elapsed"], "seconds",  "\n")
cat("---------------------- \n")

white_training_time <- system.time({
  rf_white <- randomForest(quality ~ ., data = data_white, ntree = 1000)
})
cat("-------rf_white-------")
print(rf_white)
cat("White training time: ", white_training_time["elapsed"], "seconds",  "\n")
cat("---------------------- \n")

varImpPlot(rf_red)
varImpPlot(rf_white)

# Saving the models
save(rf_red, file = "./models/rf_red.RData")
save(rf_white, file = "./models/rf_white.RData")
