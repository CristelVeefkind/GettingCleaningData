# GettingCleaningData
Week 4: Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Steps taken to clean the data

1. Merge the training and the test sets to create one data set. 
  First the X data set is enriched with the y set (the y set has the activity labels) and the  subject set  (it has the id's of the subjects). After this the train and the test set are merged together
2. Extract only the measurements on the mean and standard deviation for each measurement (by using grep to find either std or mean from the features_info file).
3. Create descriptive activity names to name the activities in the data set (comes from the file: activity_labels) 
4. Label the data set with descriptive variable names(from the features_info file).
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The results are stored in txt files in the working directory and are called:
SamsungGalaxyAccelerometer.txt
Week4Step4.txt

The working directory will have two data.tables in memory:
std_mean_table (the result of step 4)
Mean_table (the result of step5)


