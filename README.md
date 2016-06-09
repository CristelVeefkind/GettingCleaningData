# GettingCleaningData
Week 4: Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset for this assignement:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script assumes that the working directory is ../UCI HAR Dataset

Steps taken to clean the data in this script:

working directory is set and dplyr and data.table are loaded in the library

1. First read in all neccessary files x,y train and test, subjects, features and labels using fread
2. Add column names and use cbind to add X,y and subject together
3. Merge train and test together using rbind
4. Find in features.txt the column number that represent std or mean and put those numbers in a vector to use for subsetting xy_complete using filter and grep
5. Subset xy_complete with the correct columns using setkey and data.table 
6. Add the description of the activities to the table and use the labels from activity_labels.txt; change column names to V1 and activity_desc using colnmames
7. Merge activitylabels with std_mean_table using merge
8. Clean an tidy by reorder columns and add descriptive labels to columns using colnames and data.table
9. Show means grouped by subjects and activity using data.table and lapply
10. Clean up intermediate objects using remove
11. Write table step 4 and 5 using write.table

The results are stored in txt files in the working directory and are called:
SamsungGalaxyAccelerometer.txt
Week4Step4.txt

The working directory will have two data.tables in memory:
std_mean_table (the result of step 4)
Mean_table (the result of step5)


