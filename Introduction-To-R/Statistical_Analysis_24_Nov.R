dataset <- read.csv("C:/Users/student/Desktop/Nov_24/iris.csv", header= TRUE, sep=',')
head(dataset) #Print First 6 row
dataset
summary(dataset) # Print the summary of dataset

# Represent stosa, versicolor, virginica in 1,2,3
dataset$species <- factor(dataset$species, levels =c("setosa", "versicolor", "virginica"), labels=c(1,2,3))
dataset


str(dataset)


#standard deviation for an single attribute
s <- dataset$sepal_length
sd(s)


#standard deviation formultiple attribute

library(dplyr)
dataset%>%summarise_if(is.numeric, sd)


#Detect Null Values 
is.na(dataset)   # TRUE mean Missing value & FALSE mean has value

# For Specific COlumn
colSums(is.na(dataset)) # number = mumbers of missing value of that column


# for Specific ROW
which(is.na(dataset$sepal_length))


#Remove NULL Values from dataset

remove <- na.omit(dataset)
remove      
