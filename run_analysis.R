
## OS: window10; R_version: 3.5.0

## down load the dataset -- UCI HAR datasets ########################################
## reference description: 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## 1th demand -- merge training and test datasets, create one data set
if (!file.exists("./data")) dir.create("./data")
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(data_url, destfile = "./data/UCI_HAR.zip")

# unzip the data ###################################################################
# list_unzip is a list, with each element point to a data file
list_unzip <- unzip("./data/UCI_HAR.zip", exdir = "./data")

# read the UCI data into R #########################################################
df_train_X <- read.table("./data/UCI HAR Dataset/train/X_train.txt") # (7352, 561)
df_train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt") # (561)
df_train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

df_test_X <- read.table("./data/UCI HAR Dataset/test/X_test.txt") # (2947, 561)
df_test_y <- read.table("./data/UCI HAR Dataset/test/y_test.txt") # (561)
df_test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# merges the training and the test sets ############################################
df_train <- cbind(df_train_subject, df_train_y, df_train_X) #(7352, 563)
df_test <- cbind(df_test_subject, df_test_y, df_test_X) #(2947, 563)

# result -- creat one data set (10299, 563)
df_full <- rbind(df_train, df_test)

## 2th demand -- extracts only the measurements on the mean and ####################
## standard deviation for each measurement

# load feature name into R (561)
df_feature_name <- read.table("./data/UCI HAR Dataset/features.txt",
                              stringsAsFactors = FALSE)[, 2]

# extract the index of mean and standard deviation
df_feature_index <- grep(("mean\\(\\)|std\\(\\)"), df_feature_name) ## (66)

# extract the satisfied columns data -- create a new data set
df_mean_sd <- df_full[, c(1, 2, df_feature_index+2)]

colnames(df_mean_sd) <- c("subject", "activity_label", df_feature_name[df_feature_index])

## 3th demand -- uses dexcriptive activity names ###################################
## to name the activaties in the data set

# read activity names (10299)
df_activity_name <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# replace df_mean_sd$activity_label with activity names
df_mean_sd$activity_label <- factor(df_mean_sd$activity_label, 
                                    levels = df_activity_name[, 1],
                                    labels = df_activity_name[, 2])

# result -- use activity names to name the value of df_mean_sd$activity_label
colnames(df_mean_sd)[2] <- "activity"

## 4th demand -- labels the data set with descriptive variable names ################
names(df_mean_sd) <- gsub("\\(\\)", "", names(df_mean_sd))
names(df_mean_sd) <- gsub("^t", "time", names(df_mean_sd))
names(df_mean_sd) <- gsub("^f", "frequence", names(df_mean_sd))
names(df_mean_sd) <- gsub("-mean", "Mean", names(df_mean_sd))
names(df_mean_sd) <- gsub("-std", "Std", names(df_mean_sd))

## 5th demand -- from the data set in step, creates a second, independent ###########
## tidy data set with the average of each activity and each subject #################
library(dplyr)

df_group <- df_mean_sd %>% 
    group_by(df_mean_sd$subject, df_mean_sd$activity) %>%
    summarise_each(funs(mean))

write.table(df_group, "./data/mean_data.txt", row.names = FALSE)
