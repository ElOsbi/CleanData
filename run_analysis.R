#Load the needed Library, if missing please install them
library(readr)
library(dplyr)
library(data.table)


#download the zip file
zipFileName <- "data.zip"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",zipFileName)
unzip(zipfile = zipFileName)


# Set filenames and directories names in variables

test_directory <- paste(getwd(),"/UCI HAR Dataset/test/",sep="")
train_directory <- paste(getwd(),"/UCI HAR Dataset/train/",sep="")

x_test_file_name   <- paste(test_directory,"X_test.txt",sep = "")
y_test_file_name   <- paste(test_directory,"y_test.txt",sep = "")
subject_test_file_name <- paste(test_directory,"subject_test.txt",sep = "")

x_train_file_name   <- paste(train_directory,"X_train.txt",sep = "")
y_train_file_name   <- paste(train_directory,"y_train.txt",sep = "")
subject_train_file_name <- paste(train_directory,"subject_train.txt",sep = "")

activity_labels_file_name <- paste(getwd(),"/UCI HAR Dataset/activity_labels.txt",sep = "")
features_labels_file_name <- paste(getwd(),"/UCI HAR Dataset/features.txt",sep = "")


#Load Activty labels
features_test  <- read.table(x_test_file_name)
#Load Features labels
activity_test  <- read.table(y_test_file_name)

#Load features train data 
features_train  <- read.table(x_train_file_name)
#Load activity train data
activity_train  <- read.table(y_train_file_name)

# Load subjects , people involved in the experiment
subjects_test  <- read.table(subject_test_file_name)
subjects_train  <- read.table(subject_train_file_name)



#Load activity labels
activity_labels <- read.table(activity_labels_file_name) 
colnames(activity_labels) <- c("activityid","activity")

#Load feature labels
features_labels <- read.table(features_labels_file_name) 
colnames(features_labels) <- c("featureid","featurelabel")


#row bind activities train & test 
activity <- rbind(activity_train, activity_test)
#row bind features train & test 
features <- rbind(features_train, features_test)
#row bind subjects train & test
subjects <- rbind(subjects_train, subjects_test)

# Set Columns names
colnames(activity) <- c("activityid")
colnames(subjects) <- c("subjectid")
colnames(features) <- features_labels$featurelabel

#Colbind  activity & features & subjects
onedataset <- cbind(subjects,activity)
onedataset <- cbind(onedataset,features)

#Get the list of columns for measurements  on the mean and standard deviation 
mesurement_named_mean <- grep("-mean()",colnames(onedataset), fixed = TRUE)
mesurement_named_std <- grep("-std()",colnames(onedataset),  fixed = TRUE)

#At this stage all data is merged and onedataset is answer to Question 1
#onedataset a dataframe of 10299 obs and 561 + 2 columns



# create an array of with poistion of mean and position of std and 1 & 2 because they are
# position of subjectid and activityid
mesurement_names <- c(1,2,mesurement_named_mean,mesurement_named_std)
mesurement_names <- sort(mesurement_names)
#Extracts only the measurements on the mean and standard deviation for each measurement 
# & (Activity ID & Subject ID). 
onedataset <- onedataset[,mesurement_names] 

#At this stage all data is merged and onedataset is answer to Question 2
#onedataset a dataframe of 10299 obs and 68 columns


#remove from column names names characters '(' & ')' & '-' & ','
colnames(onedataset) <- gsub("[(),-]","",colnames(onedataset) )
colnames(onedataset) <- tolower(colnames(onedataset))
#At this stage all columns are having a describtive names is answer to Question 3


#In this step we will change activity id by activity label
#In order to do it we need to add an id columns to keep the order of the rows
# Merge onedataset with activity_labels, then keep only activity labels and remove activity id
# resort the dataframe and reorder the columns
onedataset$id  <- 1:nrow(onedataset)
onedataset <- merge(onedataset, activity_labels, by.x = "activityid",by.y = "activityid", all=TRUE )
onedataset <- arrange(onedataset,id)
onedataset <- select (onedataset,-id,-activityid) 
onedataset <- setcolorder(onedataset, c(colnames(onedataset)[1],colnames(onedataset)[68], colnames(onedataset)[2:67] ))
#At this stage all activities are label instead of id this is Answer to question 4 


#create a second dataset)
seconddataset <-  onedataset %>%  group_by( subjectid,activity)%>% summarise_each(funs(mean))
# seconddataset is answer to question 5
write.table(seconddataset,file="tidydata.txt",row.name=FALSE) 




