# Solution to getting and cleaning data week 4  Version 1.0


### This project contain 3 files :

* README.md list the fils and describe their use


* run_analysis.R that does the following.

    * download the file 
    * load the data
    * Merges the training and the test sets to create one data set.
    * Extracts only the measurements on the mean and standard deviation for each measurement.
    * Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names.
    * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
* CodeBook.md
Describes the variables, the data, and any transformations or work that you performed to clean up the data 



### Data source used for this project

e. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Data sources 
When the zip is downloaded the data files used by R script are the following
#### test Data
* /UCI HAR Dataset/test/X_test.txt             : feature mesurement , each columns is a value of one of 561 features
* /UCI HAR Dataset/test/y_test.txt       	   : each row is a an activity each row concern a row in  X_test.txt
* /UCI HAR Dataset/test/subject_test.txt	   : id of subject doing the experiment
#### train Data
* /UCI HAR Dataset/train/X_train.txt.txt       : feature mesurement , each columns is a value of one of 561 features
* /UCI HAR Dataset/train/y_train.txt.txt       : each row is a an activity each row concern a row in  X_test.txt
* /UCI HAR Dataset/train/subject_train.txt	   : id of subject doing the experiment 
#### Activity description file
* /UCI HAR Dataset/activity_labels.txt		   : activity labels : 1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS,4 SITTING,5 STANDING,6 LAYING

#### name of the 561 features
* /UCI HAR Dataset/features.txt				   : list of all features
