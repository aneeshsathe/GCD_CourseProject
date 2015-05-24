# run_analysis.R
# The code below loads data from test and training sets.  The data is merged and a subset is created 
# containing only the measurements on the mean and standard deviation for each measurement.
# The output of the script is a file with the average of each variable for each activity and each subject.

rm(list = ls())
require("dplyr")
require("data.table")

## Read test 
test_sub = read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)  
test_x = read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)  
test_y = read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE) 

## Read training 
train_sub = read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)  
train_x = read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)  
train_y = read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)  

## Read features and activity_labels
in_feat = read.table("UCI HAR Dataset/features.txt", header = FALSE, colClasses="character")[,2]
in_labels = read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, colClasses="character")[,2]

##Merge training and test sets
dat_merge=cbind(rbind(train_sub, test_sub),rbind(train_y, test_y),rbind(train_x, test_x))
colnames(dat_merge)= c("subject","activity",in_feat)
#head(dat_merge)


##Extract measurements on the mean and standard deviation  

mean_std_meas <- dat_merge [,c(1,2,grep("mean()|std()", names(dat_merge), ignore.case = TRUE))]

## Use descriptive activity names to name the activities in the data set
count=1
for (a_l in in_labels) {
        mean_std_meas$activity <- gsub(count, a_l, mean_std_meas$activity)
        count <- count + 1
}

## Appropriately label data set with descriptive variable names
names(mean_std_meas)<-gsub("-mean()", "mean", names(mean_std_meas), ignore.case = TRUE)
names(mean_std_meas)<-gsub("-std()", "std", names(mean_std_meas), ignore.case = TRUE)

##From step 4, independent tidy data set with the average of each variable for each activity and each subject.

pro_out_dat <- data.table(mean_std_meas)
out_dat <- pro_out_dat[,lapply(.SD,mean), by="activity,subject"]
write.table(out_dat,file="out_tidy_data.txt",sep=" ",row.names=FALSE)













