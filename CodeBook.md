# Codebook Version 1.0


Codebook Describes the variables, the data, and any transformations or work that you performed to clean up the data in run_analysis.R .

# file names used as data sources

* data.zip									   : temp file use to download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* /UCI HAR Dataset/test/X_test.txt             : feature mesurement for test data
* /UCI HAR Dataset/test/y_test.txt       	   : id of activity for test data
* /UCI HAR Dataset/test/subject_test.txt	   : id of subject doing the experiment for test data
* /UCI HAR Dataset/train/X_train.txt.txt        : feature mesurement for train data
* /UCI HAR Dataset/train/y_train.txt.txt        : activity for train data
* /UCI HAR Dataset/train/subject_train.txt	   : id of subject doing the experiment for test data
* /UCI HAR Dataset/activity_labels.txt		   : activity labels 
* /UCI HAR Dataset/features.txt				   : list of all features

# used variables

## filenames and directorties
* test_directory       : contains directory of test data files
* train_directory      : contains directory of train data files
* x_test_file_name     : contains contains filename  refering  /UCI HAR Dataset/test/X_test.txt
* y_test_file_name 	   : contains contains filename  refering  /UCI HAR Dataset/test/y_test.txt
* subject_test_file_name 	   : contains contains filename  refering  /UCI HAR Dataset/test/subject_test.txt
* x_train_file_name     	   : contains contains filename  refering  /UCI HAR Dataset/train/X_train.txt
* y_train_file_name 	   	   : contains contains filename  refering  /UCI HAR Dataset/train/y_train.txt
* subject_train_file_name 	   : contains contains filename  refering  /UCI HAR Dataset/train/subject_test.txt
* activity_labels_file_name    :  contains contains filename  refering  /UCI HAR Dataset/activity_labels.txt
* features_labels_file_name    :  contains contains filename  refering  /UCI HAR Dataset/features.txt

## dataframes readed from files
features_test       : dataframe of features of test data
activity_test		: dataframe of activity of test data
features_train		: dataframe of features of train data
activity_train		: dataframe of activity of train data
subjects_test		: dataframe of subjects of test data
subjects_train 		: dataframe of subjects of train data
activity_labels		: dataframe of id & label of activities
features_labels     : dataframe of id & label of features

## Rest of variables
activity            : dataframe consolidates activities of test and train data
features            : dataframe consolidates features of test and train data
subjects            : dataframe consolidates subjects of test and train data
mesurement_named_mean   :  List of All Columns where names contain mean
mesurement_named_std    :  List of All Columns where names contain std
mesurement_names        :  All Columns where names contain Mean or std or subjectid or activityid

## output variables 

onedataset  			: Output of question 1,2,3,4
seconddataset    		: Output of question 5

# transformations and processing

* Load librairies
* download zip file and unzip it
* Set variables containing filenames of data to getdata
* load data files in dataframes
* Merge Test and Train data by rbind of activities,features and subjects
* Merge activities,features and subjects in one dataframe by cbind  ==> Answer to Question 1 = onedataset
* create mesurement_names variable containing all columns to keep (mean, std, subjectid, activity id) So 33+33+3 = 68 columns  (FreqMean are not selected, if selected it should be 81)
* select the 68 columns from  onedataset ==> Answer to question 2 = onedataset
* remove  characters '(' & ')' & '-' & ','  and lower column names ==> Answer to question 3
* Merge onedataset with activity_labels and keep only activity labels
* reorder the rows and the columns to have subject id, activity label, then 66 features
* creates a second, independent tidy data set with the average of each variable for each activity and each subject.



