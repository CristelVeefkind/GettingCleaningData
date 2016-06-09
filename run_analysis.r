#Getting and Cleaning
setwd("~/R/GettingandCleaning/UCI HAR Dataset")
library(dplyr)
library(data.table)
#First read in all neccessary files x,y train and test, subjects, features and labels
X_test_table <- fread("test/X_test.txt")
y_test_table <-fread("test/y_test.txt")
X_train_table <- fread("train/X_train.txt")
y_train_table <-fread("train/y_train.txt")
test_subjects <- fread("test/subject_test.txt")
train_subjects <- fread("train/subject_train.txt")
features <- fread("features.txt")
activitylabels <- fread("activity_labels.txt")

#add column names and use cbind to add X,y and subject together
colnames(train_subjects)<-"subjects"
colnames(y_train_table) <- "activitycode"
colnames(X_test_table)<- as.character(seq.int(ncol(X_test_table)))
colnames(X_train_table)<- as.character(seq.int(ncol(X_train_table)))
colnames(test_subjects)<-"subjects"
colnames(y_test_table) <- "activitycode"
xy_train_table <- cbind(train_subjects,y_train_table,X_train_table)
xy_test_table <- cbind(test_subjects,y_test_table,X_test_table)

#Merge train and test together
XY_complete <- rbind(xy_test_table, xy_train_table)

#Find in features.txt the column number that represent std or mean and put
#those numbers in a vector to use for subsetting xy_complete

colnames(features)<- c("code","desc")
grep_pattern <- "(std|mean)"
std_mean_rows <- filter(features, grepl(grep_pattern, desc))
std_mean_code_vector <- c("subjects","activitycode",std_mean_rows$code)

#subset xy_complete with the correct columns
setkey(XY_complete,1)
std_mean_table <- XY_complete[,(as.vector(std_mean_code_vector)),with = FALSE]

#add the description of the activities to the table and use the labels from
#activity_labels.txt
#change column names to V1 and activity_desc
colnames(activitylabels)<- c("activitycode","activity_desc")
#merge activitylabels with std_mean_table
std_mean_table <- merge(std_mean_table, activitylabels, by = "activitycode")

#clean an tidy by reorder columns and add descriptive labels to columns
colnames(std_mean_table) <- c("activity_code","subjects",as.vector(std_mean_rows$desc),"activity_desc")
std_mean_table<- std_mean_table[,c(2,82,3:81), with = FALSE]

#show means grouped by subjects and activity using data.package
Mean_table <- std_mean_table[,lapply(.SD, mean),  by= list(subjects,activity_desc), .SDcols= c(3:81)]
Mean_table <- arrange(Mean_table, subjects)

#clean up intermediate objects
remove(X_test_table,X_train_table,y_test_table,y_train_table,xy_test_table,xy_train_table
       ,XY_complete,test_subjects, train_subjects, std_mean_rows,activitylabels, features)

#write table step 4 and 5
write.table(std_mean_table,file = "Week4Step4.txt", row.names = FALSE)
write.table(Mean_table,file = "SamsungGalaxyAccelerometer.txt", row.names = FALSE)




