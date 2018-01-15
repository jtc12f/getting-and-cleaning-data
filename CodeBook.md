#Code Book for run_analysis.R

The data for this script can be found here:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. A full description can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. [1]

##What the Script Does:

1. It loads the dplyr package, which is use to manipulate the data.
1. It downloads the zipped file containing the data to the working directory.
1. It unzips the files into a new directory.
1. It reads the data files, as well as files containing labels, from this directory into R using the read.table() function.
1. It creates a new table by binding together all of the other tables.
1. It names the columns using the information gathered in step 4. 
1. It creates a logical vector, marking "TRUE" where the column contains, mean or standard deviation, as well as subject number and activity
1. It subsets the data based on the logical vector created in step 7.
1. It merges the data to with a data set created in step 3 that includes activity labels.
1. It groups the data by subject and activity, and then applies the mean function to the measurement variables on that basis. 
1. It writes a table with this data ("secondTidyData.txt") in the working directory. 

##Variable Names:

The variable names for the final data set are:

*subject:* This is a numerical marker (1-30) designating a particular subject.

*activitylabel:* This variable refers to the type of activity being measured for the subject.

*measurement columns:* The remaining variables (e.g., "tBodyAcc-std()-Z"), represent averages of specific measurements from fitness tracker data that correspond to the activity label (e.g., "Walking") for a particular subject. 
        

##Transformations:

The measurement data for each activity type as averaged for each subject using the mean() function. For example, value for the variable "tBodyAcc-std()-Z" (-0.8260614) represents the average of every observation of subject 1 laying down. 





[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
