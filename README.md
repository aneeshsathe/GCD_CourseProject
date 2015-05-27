README Course Project - Getting and Cleaning Data 

Data was sourced from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##run_analysis.R 
1. Merges the training and the test sets into one set. 

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set 

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, makes a tidy data set with the average of each variable for each activity and each subject.

Repository Contents:

1) README.md: 

2) CodeBook.md: Describes the variables, the data, and any transformations or work performed to clean up the data 

3) tidy.txt: Result from the script with the average of each variable for each activity and each subject 

4) run_analysis.R: the script that performs the analysis

Using the Script

###NOTE:The script assumes that a folder 'UCI HAR Dataset' is in the same directory as the script with the test, train and labels files.

Libaries required: 1. data.tables 2. dplyr


