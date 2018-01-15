### Setup ###

##load "dplyr" package for data manipulation
library(dplyr)

##download zip folder to working director
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                destfile = "activitydata.zip") 

##unzip file to directory "project_data"
unzip(zipfile = "activitydata.zip", exdir = "./project_data")

### Part 1: Merge test and training data sets into one ###

##read data into tables from unzipped directory
xtrain <- read.table("./project_data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./project_data/UCI HAR Dataset/train/y_train.txt")
subtrain <- read.table("./project_data/UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./project_data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./project_data/UCI HAR Dataset/test/y_test.txt")
subtest <- read.table("./project_data/UCI HAR Dataset/test/subject_test.txt")

##read files containing labels from unzipped directory
feature <- read.table("./project_data/UCI HAR Dataset/features.txt")
featurelabels <- feature[,2]
activitylabels <- read.table("./project_data/UCI HAR Dataset/activity_labels.txt")

##merge tables to create one table
alldata <- rbind(cbind(subtrain,xtrain,ytrain), cbind(subtest,xtest,ytest))

##label columns using labels pulled earlier
colnames(alldata) <- c("subject", as.character(featurelabels), "activitycode")
colnames(activitylabels) <- c("activitycode", "activitylabel")

### Part 2: Select mean and standard deviation values ###

##create a logical vector indicating columns that contain subject, activity code, mean, or standard dev.
good <- grepl("[Ss]ubject|mean|std|[Aa]ctivity", colnames(alldata))

##subset data based on new logical vector
alldataselect <- alldata[,good]

### Part 3: Descriptive Activity Names ###

## merges activitylabels table with selected data table to give labels to activites
finaldata <- merge(alldataselect, activitylabels, by ="activitycode", all.x = TRUE)
finaldata <- select(finaldata, -activitycode)

### Part 4: New Data Set with means by activty

groupfinal <- group_by(finaldata, subject, activitylabel)
secondset <- summarize_all(groupfinal, funs(mean))

write.table(secondset, "secondTidyData.txt", row.names = FALSE)

