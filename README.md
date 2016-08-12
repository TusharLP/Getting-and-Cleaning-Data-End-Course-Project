# Getting-and-Cleaning-Data-End-Course-Project
End-Course Project for the Course Getting and Cleaning Data in Coursera

The analysis is explained here:

First the zipped file is downloaded and unzipped into the folder 'UCI HAR Dataset'. 

In R, the working directory is set to the folder containing the folder 'UCI HAR Dataset'. 

The R script, run_analysis.R, does the following:

1) Load the features text file and extracts the list of features containg mean and standard deviations

2) Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation using extracted features from previous step

3)Loads the activity and subject data for each dataset, and merges those columns with the dataset

4) Merges the train and test datasets

5) Replace activity label by their corresponding activity

6) Converts the activity and subject columns into factors

7) Creates a tidy dataset that consists of the average of each variable for each activity and each subject.

8) Saves this tidy dataset as tidydata.txt which is the end-result
