library(ggplot2)

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

# Checking wine quality count of both data.frames
red_quality_quantity <- table(data_red$quality)
red_quality <- data_red$quality

white_quality_quantity <- table(data_white$quality)
white_quality <- data_white$quality

# Dataviz of wine quality count
red_plot_quality_quantity <- ggplot(data_red, aes(x = quality)) +
  geom_bar(fill = "red") +
  labs(title = "Red Wine Quality", x = "Quality (Class)", y = "Quantity (Count)") +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5) +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "grey"),
  ) +
  scale_x_continuous(
    breaks = seq(
      min(red_quality),
      max(red_quality),
      by = 1)
    )

white_plot_quality_quantity <- ggplot(
  data_white, aes(x = quality)) +
  geom_bar(fill = "white") +
  labs(title = "White Wine Quality", x = "Quality (Class)", y = "Quantity (Count)") +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5) +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "grey"),
  ) +
  scale_x_continuous(
    breaks = seq(
      min(white_quality),
      max(white_quality),
      by = 1
    )
  )
