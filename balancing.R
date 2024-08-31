library(ggplot2)
library(cowplot)
library(caret)


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

# Getting and visualizing the quantity of each quality class
red_quality <- data_red$quality
white_quality <- data_white$quality

red_plot_quality_quantity <- ggplot(data_red, aes(x = quality)) +
  geom_bar(fill = "red") +
  labs(x = "Quality (Class)", y = "Quantity (Count)") +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.5) +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "grey")) +
  scale_x_continuous(breaks = seq(min(red_quality), max(red_quality), by = 1))

white_plot_quality_quantity <- ggplot(data_white, aes(x = quality)) +
  geom_bar(fill = "white") +
  labs(x = "Quality (Class)", y = "Quantity (Count)") +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.5) +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "grey")) +
  scale_x_continuous(breaks = seq(min(red_quality), max(red_quality), by = 1))

plot_grid(
  red_plot_quality_quantity,
  white_plot_quality_quantity,
  labels = c("Red Wine", "White Wine"),
  ncol = 2,
  label_size = 12
)

# Balancing the data
red_quality_factor <- as.factor(red_quality)
data_red_balanced <- upSample(
  x = data_red,
  y = red_quality_factor
)

white_quality_factor <- as.factor(white_quality)
data_white_balanced <- upSample(
  x = data_white,
  y = white_quality_factor
)

red_plot_balanced_quality_quantity <- ggplot(data_red_balanced, aes(x = quality)) +
  geom_bar(fill = "red") +
  labs(x = "Quality (Class)", y = "Quantity (Count)") +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.5) +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "grey")) +
  scale_x_continuous(breaks = seq(min(red_quality), max(red_quality), by = 1))

white_plot_balanced_quality_quantity <- ggplot(data_white_balanced, aes(x = quality)) +
  geom_bar(fill = "white") +
  labs(x = "Quality (Class)", y = "Quantity (Count)") +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.5) +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "grey")) +
  scale_x_continuous(breaks = seq(min(red_quality), max(red_quality), by = 1))

plot_grid(
  red_plot_balanced_quality_quantity,
  white_plot_balanced_quality_quantity,
  labels = c("Red Wine", "White Wine"),
  ncol = 2,
  label_size = 12
)

# Saving the balanced data
write.csv(data_red_balanced,
          "./bases-de-dados/winequality-red-balanced.csv",
          row.names = FALSE)
write.csv(data_white_balanced,
          "./bases-de-dados/winequality-white-balanced.csv",
          row.names = FALSE)
