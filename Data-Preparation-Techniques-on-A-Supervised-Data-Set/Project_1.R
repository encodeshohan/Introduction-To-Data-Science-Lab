install.packages("readxl") 
library(readxl)
mainData <- read_excel("D:/MID-Data-Science-Project/Project-1/Midterm_Dataset_Section(C).xlsx")
print(mainData) 



numberOfCol <- ncol(mainData)
numberOfRow <- nrow(mainData)
cat("Number of Column: ", numberOfCol, "\n")
cat("Number of Row: ", numberOfRow, "\n")
str(mainData)



install.packages("dplyr")
library(dplyr)
mainData <- distinct(mainData)
mainData
numberOfCol <- ncol(mainData)
numberOfRow <- nrow(mainData)
cat("Number of Column: ", numberOfCol, "\n")
cat("Number of Row: ", numberOfRow, "\n")



unique(mainData$person_age)
unique(mainData$person_emp_exp)
unique(mainData$person_home_ownership)




handleInvaData <- mainData
handleInvaData$person_home_ownership <- ifelse(
  substr(handleInvaData$person_home_ownership, 1, 2) == "OT", "OTHER",
  ifelse(
    substr(handleInvaData$person_home_ownership, 1, 1) == "M", "MORTGAGE",
    ifelse(
      substr(handleInvaData$person_home_ownership, 1, 1) == "R", "RENT",
      ifelse(
        substr(handleInvaData$person_home_ownership, 1, 1) == "O", "OWN",
        NA
      )
    )
  )
)
unique(handleInvaData$person_home_ownership)



annoData <- handleInvaData
annoData$person_gender <- factor(annoData$person_gender, levels = c("female", "male"), labels = c(0, 1)) 
annoData$person_gender

annoData$person_education <- factor(annoData$person_education, levels = c("High School", "Bachelor", "Master", "Associate", "Doctorate"), labels = c(1, 2, 3, 4, 5)) 
annoData$person_education

annoData$person_home_ownership <- factor(annoData$person_home_ownership, levels = c("RENT", "OWN", "MORTGAGE", "OTHER"), labels = c(1, 2, 3, 4)) 
annoData$person_home_ownership

annoData$loan_intent <- factor(annoData$loan_intent, levels = c("PERSONAL", "EDUCATION", "MEDICAL", "VENTURE", "HOMEIMPROVEMENT", "DEBTCONSOLIDATION"), labels = c(1, 2, 3, 4, 5, 6)) 
annoData$loan_intent

annoData$previous_loan_defaults_on_file <- factor(annoData$previous_loan_defaults_on_file, levels = c("No", "Yes"), labels = c(0,1)) 
annoData$previous_loan_defaults_on_file

annoData



summary(annoData)



numOfMissValue <- colSums(is.na(annoData))
numOfMissValue



newData1 <- na.omit(annoData) 
numOfMissValue <- colSums(is.na(newData1)) 
numOfMissValue 



newData2 <- annoData 
newData2$person_gender <- as.numeric(newData2$person_gender)
newData2$person_education <- as.numeric(newData2$person_education)
for (col_name in names(newData2)) { 
  if (is.numeric(newData2[[col_name]])) {
    column_mean <- mean(newData2[[col_name]], na.rm = TRUE)
    newData2[[col_name]][is.na(newData2[[col_name]])] <- column_mean
    newData2[[col_name]] <- round(newData2[[col_name]], digits = 0) 
  } 
}
numOfMissValue <- colSums(is.na(newData2))
numOfMissValue



find_outliers_iqr <- function(column) {
  Q1 <- quantile(column, 0.25, na.rm = TRUE)
  Q3 <- quantile(column, 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  outliers <- column[column < lower_bound | column > upper_bound]
  return(outliers)
}
outliers_age <- find_outliers_iqr(newData2$person_age)
outliers_income <- find_outliers_iqr(newData2$person_income)
outliers_emp_exp <- find_outliers_iqr(newData2$person_emp_exp)
outliers_loan_int_rate <- find_outliers_iqr(newData2$loan_int_rate)
outliers_loan_percent_income <- find_outliers_iqr(newData2$loan_percent_income)
outliers_credit_score <- find_outliers_iqr(newData2$credit_score)

outliers_age
outliers_income
outliers_emp_exp
outliers_loan_int_rate
outliers_loan_percent_income
outliers_credit_score



cleanData <- newData1
cleanData <- cleanData[!(cleanData$person_age %in% outliers_age), ]
cleanData <- cleanData[!(cleanData$person_income %in% outliers_income), ]
cleanData <- cleanData[!(cleanData$person_emp_exp %in% outliers_emp_exp), ]
cleanData <- cleanData[!(cleanData$loan_int_rate %in% outliers_loan_int_rate), ]
cleanData <- cleanData[!(cleanData$loan_percent_income %in% outliers_loan_percent_income), ]
cleanData <- cleanData[!(cleanData$credit_score %in% outliers_credit_score), ]
cleanData




NorData<- cleanData
min_person_income <- min(NorData$person_income, na.rm = TRUE) 
max_person_income <- max(NorData$person_income, na.rm = TRUE)
NorData$person_income <- (NorData$person_income - min_person_income) / (max_person_income - min_person_income)
NorData



OutputData <- NorData
OutputData$person_gender <- factor(OutputData$person_gender, levels = c(0, 1), labels = c("female", "male"))
OutputData$person_education <- factor(OutputData$person_education, levels = c(1, 2, 3, 4, 5), labels = c("High School", "Bachelor", "Master", "Associate", "Doctorate")) 
OutputData$person_home_ownership <- factor(OutputData$person_home_ownership, levels = c(1, 2, 3, 4), labels = c("RENT", "OWN", "MORTGAGE", "OTHER")) 
OutputData$loan_intent <- factor(OutputData$loan_intent, levels = c(1, 2, 3, 4, 5, 6), labels = c("PERSONAL", "EDUCATION", "MEDICAL", "VENTURE", "HOMEIMPROVEMENT", "DEBTCONSOLIDATION")) 
OutputData$previous_loan_defaults_on_file <- factor(OutputData$previous_loan_defaults_on_file, levels = c(0, 1), labels = c("No", "Yes")) 
OutputData


mean(OutputData$person_income)
mean(OutputData$loan_amnt)

median(OutputData$person_income)
median(OutputData$loan_amnt)

Mode <- function(m) {
  uniq_vals <- unique(m)
  uniq_vals[which.max(tabulate(match(m, uniq_vals)))]
}
Mode(m = OutputData$person_income)
Mode(m = OutputData$loan_amnt)



rangeValue <- function(r){
  max(r) - min(r)
}
rangeValue(r = OutputData$person_income)
rangeValue(r = OutputData$loan_amnt)

var(OutputData$person_income)
var(OutputData$loan_amnt)

sd(OutputData$person_income)
sd(OutputData$loan_amnt)


install.packages("ROSE")
library(ROSE)
library(dplyr)

class_distribution <- table(OutputData$loan_status)
class_distribution

if (class_distribution[1] > class_distribution[2]) {
  majority <- filter(OutputData, loan_status == 0)
  minority <- filter(OutputData, loan_status == 1)
} else {
  majority <- filter(OutputData, loan_status == 1)
  minority <- filter(OutputData, loan_status == 0)
}

set.seed(123)
oversampled_minority <- minority %>% sample_n(nrow(majority), replace = TRUE)
oversampled_data <- bind_rows(majority, oversampled_minority)

table(oversampled_data$loan_status)