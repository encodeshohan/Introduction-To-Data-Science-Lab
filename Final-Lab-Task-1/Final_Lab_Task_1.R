library(dplyr)
library(DescTools) 
library(infotheo) 

mainData <- read.csv("C:/AIUB One Drive/OneDrive - American International University-Bangladesh/Desktop/IDS_Lab/Final_Lab Task 1/dataset.csv")



gender_lung_table <- table(mainData$GENDER, mainData$LUNG_CANCER)
gender_lung_chi_squared_result <- chisq.test(gender_lung_table)
print(gender_lung_chi_squared_result)



age_lung_table <- table(mainData$AGE, mainData$LUNG_CANCER)
anova_result <- aov(AGE ~ LUNG_CANCER, data = mainData)
summary(anova_result)



smoking_mutual_info <- mutinformation(mainData$SMOKING, mainData$LUNG_CANCER)
print(smoking_mutual_info)

smoking_lung_table <- table(mainData$SMOKING, mainData$LUNG_CANCER)
smoking_lung_chi_squared_results <- chisq.test(smoking_lung_table)
print(smoking_lung_chi_squared_results)



perform_tests <- function(attribute, response) {
  mutual_info <- mutinformation(attribute, response)
  chi_sq_result <- chisq.test(table(attribute, response))
  list(mutual_info = mutual_info, chi_squared = chi_sq_result)
}

yellow_finger_results <- perform_tests(mainData$YELLOW_FINGERS, mainData$LUNG_CANCER)
print(yellow_finger_results)

anxiety_results <- perform_tests(mainData$ANXIETY, mainData$LUNG_CANCER)
print(anxiety_results)

peer_pressure_results <- perform_tests(mainData$PEER_PRESSURE, mainData$LUNG_CANCER)
print(peer_pressure_results)

chronic_disease_results <- perform_tests(mainData$CHRONIC_DISEASE, mainData$LUNG_CANCER)
print(chronic_disease_results)

fatigue_results <- perform_tests(mainData$FATIGUE, mainData$LUNG_CANCER)
print(fatigue_results)

allergy_results <- perform_tests(mainData$ALLERGY, mainData$LUNG_CANCER)
print(allergy_results)

wheezing_results <- perform_tests(mainData$WHEEZING, mainData$LUNG_CANCER)
print(wheezing_results)

alchohol_results <- perform_tests(mainData$ALCOHOL_CONSUMING, mainData$LUNG_CANCER)
print(alchohol_results)

coughing_results <- perform_tests(mainData$COUGHING, mainData$LUNG_CANCER)
print(coughing_results)

breath_results <- perform_tests(mainData$SHORTNESS_OF_BREATH, mainData$LUNG_CANCER)
print(breath_results)

swallo_results <- perform_tests(mainData$SWALLOWING_DIFFICULTY, mainData$LUNG_CANCER)
print(swallo_results)

chest_pain_results <- perform_tests(mainData$CHEST_PAIN, mainData$LUNG_CANCER)
print(chest_pain_results)