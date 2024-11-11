patientID <- c(1,2,3,4)
age <- c(24,34,28,52)
diabetes <- c("Type1","Type2","Type1","Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata

# Add New Column Through $
# patientdata$blood_group <- c("A+", "O+", "AB+", "B+")
# patientdata

# # Add New Column Through Function
# blood_group <- c("A+", "O+", "AB+", "B+")
# new_patientdata <- cbind(patientdata, blood_group)
# new_patientdata

#Add New Row
new_row <- c(5, 42, "Type1", "Poor", "A-")
patientdata <- rbind(patientdata, new_row)
patientdata


# FACTOR

# List

g <- "My First List"
h <- c(25,26,18,39)
j<- matrix(1:10, nrow=5)
k<- c("one", "two", "three")
mylist <- list (title=g, ages= h, j,k)
mylist


# User Input by readline

var1 <- readline(prompt = "Enter Any Value: ")
var2 <- readline(prompt = "Enter Any Number: ")

var2 <- as.integer(var2)
var1
var2

# User Input by scan
x <- scan()  # press enter twice to terminate the process
print(x)

# Take string type input through scan()
y <- (what= " ")
y

# Entering Data From Keyboard Using Text Editor

myData <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))
myData<- edit(myData)
#myData

# Export data set to .csv 

#write.csv(myData, "C:\\Users\\student\\Desktop\\Dat_Set\\myData1.csv", row.names=FALSE)
write.csv(myData, "C:/Users/student/Desktop/Dat_Set/myData.csv", row.names=FALSE)

newData <- read.csv("C:/Users/student/Desktop/Read_CSV_Folder/iris.csv", header= TRUE , sep=",")
# access 5 to 10 row
newData[5:10,]

# access specific row
newData[c(5, 7),]

subset(newData, species=="setosa")
subset(newData, petal_length >= 6)
