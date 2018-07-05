# Code book


## 1. Download the original data -- UCI HAR Dataset
* The full description of the original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The URL for downloading the UCI HAR dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzip the download UCI_HAR.zip
* give the files list we used in our project:

```
file                | Description

README.txt          | Descriptions of the UCI HAR Datasets
features_info.txt   | Shows information about the variables used on the feature vector.
subject_train.txt   | Each row identifies the subject who performed the activity for each window sample. range from 1 to 30.
subject_test.txt    | Each row identifies the subject who performed the activity for each window sample. Range from 1 to 30.
activity_labels.txt | Links the class labels with their activity name.
X_train.txt         | Training set.
y_train.txt         | Training labels.
X_test.txt          | Training set.
y_test.txt          | Training labels.
features.txt        | List of all features.
```
```
note : features are normalized and bounded with in [-1, 1].
```

## Step 1 -- Merges the training and the test sets to create one data set
* Read the data files
```
read from: ./data/UCI HAR Dataset/train/X_train.txt
read from: ./data/UCI HAR Dataset/train/y_train.txt
read from:./data/UCI HAR Dataset/train/subject_train.txt
read from: ./data/UCI HAR Dataset/test/X_test.txt
read from: ./data/UCI HAR Dataset/test/y_test.txt
read from: ./data/UCI HAR Dataset/test/subject_test.txt
```

* merges the training dataset -- dim = (7352, 563)
* merges the test dataset -- dim = (2947, 563)
* creat one dataset -- merges the train and test dataset, dim = (10299, 563)
* write the generated data to a txt files
```
write to : ./data/df_full.txt
```

## Step 2 -- Extracts only the measurements on the mean and standard deviation for each measurement
* load feature name into R
```
read from : ./data/UCI HAR Dataset/features.txt
```

* extract the index of mean and standard deviation
* create a new data set composed with mean and sd data -- dim = (10299, 68)
* replace the column names of the new data -- use features.txt
* write the generated data to txt files
```
write to : ./data/df_mean_sd.txt
```

```
colnames(df_mean_sd)
```

```
 [1] "subject"                     "activity"                    "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
 [5] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 [9] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[17] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
[29] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[33] "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[45] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
[53] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[57] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
[65] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"
```

## Step 3 -- Uses descriptive activity names to name the activities in the data set
* read the activity names
```
read from : ./data/UCI HAR Dataset/activity_labels.txt
```

```
activity names: 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
```

* replace the activity names of new data geneted by step 2
* write the generated data to a txt files
```
write to : ./data/df_named_activity.txt
```

## Step 4 -- Appropriately labels the data set with descriptive variable names
* delete the "()" contained in the column name
* replace "t" with "time" in the column name
* replace "f" with "frequence: in the column name
* replace "-mean" with "Mean" in the column name
* replace "-std" with "Std" in the column name
* write the generated data to a txt file
```
write to : ./data/df_with_descriptive_variable_names.txt
```

```
colnames(df_with_descriptive_variable_names)
```

```
[1] "subject"                          "activity"                         "timeBodyAccMean-X"               
 [4] "timeBodyAccMean-Y"                "timeBodyAccMean-Z"                "timeBodyAccStd-X"                
 [7] "timeBodyAccStd-Y"                 "timeBodyAccStd-Z"                 "timeGravityAccMean-X"            
[10] "timeGravityAccMean-Y"             "timeGravityAccMean-Z"             "timeGravityAccStd-X"             
[13] "timeGravityAccStd-Y"              "timeGravityAccStd-Z"              "timeBodyAccJerkMean-X"           
[16] "timeBodyAccJerkMean-Y"            "timeBodyAccJerkMean-Z"            "timeBodyAccJerkStd-X"            
[19] "timeBodyAccJerkStd-Y"             "timeBodyAccJerkStd-Z"             "timeBodyGyroMean-X"              
[22] "timeBodyGyroMean-Y"               "timeBodyGyroMean-Z"               "timeBodyGyroStd-X"               
[25] "timeBodyGyroStd-Y"                "timeBodyGyroStd-Z"                "timeBodyGyroJerkMean-X"          
[28] "timeBodyGyroJerkMean-Y"           "timeBodyGyroJerkMean-Z"           "timeBodyGyroJerkStd-X"           
[31] "timeBodyGyroJerkStd-Y"            "timeBodyGyroJerkStd-Z"            "timeBodyAccMagMean"              
[34] "timeBodyAccMagStd"                "timeGravityAccMagMean"            "timeGravityAccMagStd"            
[37] "timeBodyAccJerkMagMean"           "timeBodyAccJerkMagStd"            "timeBodyGyroMagMean"             
[40] "timeBodyGyroMagStd"               "timeBodyGyroJerkMagMean"          "timeBodyGyroJerkMagStd"          
[43] "frequenceBodyAccMean-X"           "frequenceBodyAccMean-Y"           "frequenceBodyAccMean-Z"          
[46] "frequenceBodyAccStd-X"            "frequenceBodyAccStd-Y"            "frequenceBodyAccStd-Z"           
[49] "frequenceBodyAccJerkMean-X"       "frequenceBodyAccJerkMean-Y"       "frequenceBodyAccJerkMean-Z"      
[52] "frequenceBodyAccJerkStd-X"        "frequenceBodyAccJerkStd-Y"        "frequenceBodyAccJerkStd-Z"       
[55] "frequenceBodyGyroMean-X"          "frequenceBodyGyroMean-Y"          "frequenceBodyGyroMean-Z"         
[58] "frequenceBodyGyroStd-X"           "frequenceBodyGyroStd-Y"           "frequenceBodyGyroStd-Z"          
[61] "frequenceBodyAccMagMean"          "frequenceBodyAccMagStd"           "frequenceBodyBodyAccJerkMagMean" 
[64] "frequenceBodyBodyAccJerkMagStd"   "frequenceBodyBodyGyroMagMean"     "frequenceBodyBodyGyroMagStd"     
[67] "frequenceBodyBodyGyroJerkMagMean" "frequenceBodyBodyGyroJerkMagStd"
```

## Step 5 -- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
* use a pipeline command to summarise the average of each variable for each activity and each subject
```
note : the factor of suject is 30, the factor of activity is 6
therefore : the generated data table has 30x6 rows, and 68 columns
of with: the column 3 through 68 are features.
```

* write the generated data to a txt file
```
write to : ./data/df_tidy.txt
```

```
str(df_gropu)
```

```
Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	180 obs. of  68 variables:
 $ subject                         : int  1 1 1 1 1 1 2 2 2 2 ...
 $ activity                        : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ timeBodyAccMean-X               : num  0.277 0.255 0.289 0.261 0.279 ...
 $ timeBodyAccMean-Y               : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
 $ timeBodyAccMean-Z               : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
 $ timeBodyAccStd-X                : num  -0.284 -0.355 0.03 -0.977 -0.996 ...
 $ timeBodyAccStd-Y                : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
 $ timeBodyAccStd-Z                : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...
 $ timeGravityAccMean-X            : num  0.935 0.893 0.932 0.832 0.943 ...
 $ timeGravityAccMean-Y            : num  -0.282 -0.362 -0.267 0.204 -0.273 ...
 $ timeGravityAccMean-Z            : num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...
 $ timeGravityAccStd-X             : num  -0.977 -0.956 -0.951 -0.968 -0.994 ...
 $ timeGravityAccStd-Y             : num  -0.971 -0.953 -0.937 -0.936 -0.981 ...
 $ timeGravityAccStd-Z             : num  -0.948 -0.912 -0.896 -0.949 -0.976 ...
 $ timeBodyAccJerkMean-X           : num  0.074 0.1014 0.0542 0.0775 0.0754 ...
 $ timeBodyAccJerkMean-Y           : num  0.028272 0.019486 0.02965 -0.000619 0.007976 ...
 $ timeBodyAccJerkMean-Z           : num  -0.00417 -0.04556 -0.01097 -0.00337 -0.00369 ...
 $ timeBodyAccJerkStd-X            : num  -0.1136 -0.4468 -0.0123 -0.9864 -0.9946 ...
 $ timeBodyAccJerkStd-Y            : num  0.067 -0.378 -0.102 -0.981 -0.986 ...
 $ timeBodyAccJerkStd-Z            : num  -0.503 -0.707 -0.346 -0.988 -0.992 ...
 $ timeBodyGyroMean-X              : num  -0.0418 0.0505 -0.0351 -0.0454 -0.024 ...
 $ timeBodyGyroMean-Y              : num  -0.0695 -0.1662 -0.0909 -0.0919 -0.0594 ...
 $ timeBodyGyroMean-Z              : num  0.0849 0.0584 0.0901 0.0629 0.0748 ...
 $ timeBodyGyroStd-X               : num  -0.474 -0.545 -0.458 -0.977 -0.987 ...
 $ timeBodyGyroStd-Y               : num  -0.05461 0.00411 -0.12635 -0.96647 -0.98773 ...
 $ timeBodyGyroStd-Z               : num  -0.344 -0.507 -0.125 -0.941 -0.981 ...
 $ timeBodyGyroJerkMean-X          : num  -0.09 -0.1222 -0.074 -0.0937 -0.0996 ...
 $ timeBodyGyroJerkMean-Y          : num  -0.0398 -0.0421 -0.044 -0.0402 -0.0441 ...
 $ timeBodyGyroJerkMean-Z          : num  -0.0461 -0.0407 -0.027 -0.0467 -0.049 ...
 $ timeBodyGyroJerkStd-X           : num  -0.207 -0.615 -0.487 -0.992 -0.993 ...
 $ timeBodyGyroJerkStd-Y           : num  -0.304 -0.602 -0.239 -0.99 -0.995 ...
 $ timeBodyGyroJerkStd-Z           : num  -0.404 -0.606 -0.269 -0.988 -0.992 ...
 $ timeBodyAccMagMean              : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
 $ timeBodyAccMagStd               : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
 $ timeGravityAccMagMean           : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
 $ timeGravityAccMagStd            : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
 $ timeBodyAccJerkMagMean          : num  -0.1414 -0.4665 -0.0894 -0.9874 -0.9924 ...
 $ timeBodyAccJerkMagStd           : num  -0.0745 -0.479 -0.0258 -0.9841 -0.9931 ...
 $ timeBodyGyroMagMean             : num  -0.161 -0.1267 -0.0757 -0.9309 -0.9765 ...
 $ timeBodyGyroMagStd              : num  -0.187 -0.149 -0.226 -0.935 -0.979 ...
 $ timeBodyGyroJerkMagMean         : num  -0.299 -0.595 -0.295 -0.992 -0.995 ...
 $ timeBodyGyroJerkMagStd          : num  -0.325 -0.649 -0.307 -0.988 -0.995 ...
 $ frequenceBodyAccMean-X          : num  -0.2028 -0.4043 0.0382 -0.9796 -0.9952 ...
 $ frequenceBodyAccMean-Y          : num  0.08971 -0.19098 0.00155 -0.94408 -0.97707 ...
 $ frequenceBodyAccMean-Z          : num  -0.332 -0.433 -0.226 -0.959 -0.985 ...
 $ frequenceBodyAccStd-X           : num  -0.3191 -0.3374 0.0243 -0.9764 -0.996 ...
 $ frequenceBodyAccStd-Y           : num  0.056 0.0218 -0.113 -0.9173 -0.9723 ...
 $ frequenceBodyAccStd-Z           : num  -0.28 0.086 -0.298 -0.934 -0.978 ...
 $ frequenceBodyAccJerkMean-X      : num  -0.1705 -0.4799 -0.0277 -0.9866 -0.9946 ...
 $ frequenceBodyAccJerkMean-Y      : num  -0.0352 -0.4134 -0.1287 -0.9816 -0.9854 ...
 $ frequenceBodyAccJerkMean-Z      : num  -0.469 -0.685 -0.288 -0.986 -0.991 ...
 $ frequenceBodyAccJerkStd-X       : num  -0.1336 -0.4619 -0.0863 -0.9875 -0.9951 ...
 $ frequenceBodyAccJerkStd-Y       : num  0.107 -0.382 -0.135 -0.983 -0.987 ...
 $ frequenceBodyAccJerkStd-Z       : num  -0.535 -0.726 -0.402 -0.988 -0.992 ...
 $ frequenceBodyGyroMean-X         : num  -0.339 -0.493 -0.352 -0.976 -0.986 ...
 $ frequenceBodyGyroMean-Y         : num  -0.1031 -0.3195 -0.0557 -0.9758 -0.989 ...
 $ frequenceBodyGyroMean-Z         : num  -0.2559 -0.4536 -0.0319 -0.9513 -0.9808 ...
 $ frequenceBodyGyroStd-X          : num  -0.517 -0.566 -0.495 -0.978 -0.987 ...
 $ frequenceBodyGyroStd-Y          : num  -0.0335 0.1515 -0.1814 -0.9623 -0.9871 ...
 $ frequenceBodyGyroStd-Z          : num  -0.437 -0.572 -0.238 -0.944 -0.982 ...
 $ frequenceBodyAccMagMean         : num  -0.1286 -0.3524 0.0966 -0.9478 -0.9854 ...
 $ frequenceBodyAccMagStd          : num  -0.398 -0.416 -0.187 -0.928 -0.982 ...
 $ frequenceBodyBodyAccJerkMagMean : num  -0.0571 -0.4427 0.0262 -0.9853 -0.9925 ...
 $ frequenceBodyBodyAccJerkMagStd  : num  -0.103 -0.533 -0.104 -0.982 -0.993 ...
 $ frequenceBodyBodyGyroMagMean    : num  -0.199 -0.326 -0.186 -0.958 -0.985 ...
 $ frequenceBodyBodyGyroMagStd     : num  -0.321 -0.183 -0.398 -0.932 -0.978 ...
 $ frequenceBodyBodyGyroJerkMagMean: num  -0.319 -0.635 -0.282 -0.99 -0.995 ...
 $ frequenceBodyBodyGyroJerkMagStd : num  -0.382 -0.694 -0.392 -0.987 -0.995 ...
 - attr(*, "vars")= chr "subject"
 - attr(*, "drop")= logi TRUE
```

