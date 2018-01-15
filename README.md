# getting-and-cleaning-data
What the script does:
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
