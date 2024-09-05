# Plotting ROC curve
# ref: https://www.r-bloggers.com/2016/08/plotting-roc-curves/
library(pROC)
roc_red <- roc(data_red$quality, predict(rf_red, data_red))
roc_white <- roc(data_white$quality, predict(rf_white, data_white))