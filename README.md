# Getting-and-cleaning-data -- Coursera

## Description of project

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.


> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

> Here are the data for the project:

> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

> You should create one R script called run_analysis.R that does the following.

> Merges the training and the test sets to create one data set.
> Extracts only the measurements on the mean and standard deviation for each measurement.
> Uses descriptive activity names to name the activities in the data set
> Appropriately labels the data set with descriptive variable names.
> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

> Good luck!

## The demands of this project and the generated data file of each step

* Step 1 Merges the training and the test sets to create one data set -- df_full.txt
* Step 2 Extracts only the measurements on the mean and standard deviation for each measurement -- df_mean_sd.txt
* Step 3 Uses descriptive activity names to name the activities in the data set -- df_named_activity.txt
* Step 4 Appropriately labels the data set with descriptive variable names -- df_with_descriptive_variable_names.txt
* Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject --df_tidy.txt

## The descriptions of generated data files in our repo

* df_full.txt -- the merged data, dim = (10299, 563)
* df_mean_sd.txt -- extractes mean and standard deviation for each measrement, dim = (10299, 68)
* df_named_activity.txt -- dim = (10299, 68)
* df_with_descriptive_variable_names.txt -- dim = (10299, 68)
* df_tidy.txt -- final tidy data, dim = (180, 70), of which, columns from 5 to 70 are the features

## The scripts and codebook file

+ run_analysis.R -- the script of this project
+ codebook.md -- Markdown

