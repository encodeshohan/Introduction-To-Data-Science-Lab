library(dplyr)
library(ggplot2)
library(rcompanion)
library(e1071)

mainData <- read.csv("C:/AIUB One Drive/OneDrive - American International University-Bangladesh/Desktop/IDS_Lab/Final-Lab-Task-2/dataset.csv", header=TRUE, sep=',',na.strings = c("N/A", ""))
mainData

no_of_col <- ncol(mainData)
no_of_row <- nrow(mainData)
cat("No of row in the Dataset: ", no_of_row) 
cat("No of column in the Dataset: ", no_of_col) 
str(data)



gender_counts <- table(mainData$GENDER)
barplot(gender_counts, xlab = "Gender", ylab = "Frequency", main = "Bar Graph for Gender Attribute")



hist(mainData$AGE, main = "Histogram of Age", xlab = "Age")



hist(mainData$AGE, probability = TRUE, main = "Line Histogram with Density", xlab = "Age")
lines(density(mainData$AGE), lwd = 3, col="blue" )

plotNormalHistogram(mainData$AGE, prob = FALSE, main = "Line Histogram with Overlay", xlab = "AGE") 



skewness_value <- skewness(mainData$AGE)
if (skewness_value > 0) {
  skewness_type <- "Positive"
} else if (skewness_value < 0) {
  skewness_type <- "Negative"
} else {
  skewness_type <- "Zero"
}
print(paste("The data is", skewness_type, "skewed."))
print(paste("Skewness:", skewness_value))

text(x = max(mainData$AGE) * 0.7, y = max(table(mainData$AGE)) * 0.8, 
     labels = paste("Skewness:", round(skewness_value, 3), "\n", skewness_type, "Skewness"), 
     col = "blue", cex = 0.8)


boxplot(mainData$AGE, 
        main = "Box Plot for AGE", 
        ylab = "AGE",
        col = "skyblue", 
        border = "red")

ggplot(mainData, aes(x = GENDER, y = AGE)) +
  geom_boxplot(fill = "skyblue", color = "red", alpha = 0.7) +
  labs(title = "Boxplot of Age by Gender", x = "Gender", y = "Age") +
  theme_minimal()





ggplot(mainData, aes(x = AGE, y = SMOKING, color = GENDER)) +
  geom_point(alpha = 0.7) +
  labs(title = "Scatter Plot of Age vs. SMOKING", x = "Age", y = "SMOKING", color = "Gender") +
  theme_minimal()



ggplot(mainData, aes(x = SMOKING, y = AGE)) +
  geom_violin(fill = "skyblue", color = "black", alpha = 0.7) +
  geom_boxplot(width = 0.1, position = position_dodge(0.9), alpha = 0.5) +
  labs(title = "Violin Plot of Age by Smoking", x = "Smoking", y = "Age") +
  theme_minimal()



ggplot(mainData, aes(x = SMOKING, y = AGE, group = 1)) +
  stat_summary(fun = mean, geom = "point", size = 3, color = "blue") +
  stat_summary(fun = mean, geom = "line", size = 1, color = "blue") +
  stat_summary(fun = mean, geom = "point", size = 3, color = "red") +
  labs(title = "Line Graph of Mean Age by Smoking", x = "Smoking", y = "Age") +
  theme_minimal()