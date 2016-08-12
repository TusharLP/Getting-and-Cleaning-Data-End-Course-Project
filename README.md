# Getting-and-Cleaning-Data-End-Course-Project
End-Course Project for the Course Getting and Cleaning Data in Coursera

The goal of this project is to prepare a tidy data that can be used for later analysis. The data can be obtained from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##The analysis is explained here:

First the zipped file is downloaded and unzipped into the folder 'UCI HAR Dataset'. 

In R, the working directory is set to the folder containing the folder 'UCI HAR Dataset'. 

The R script, run_analysis.R, does the following:

*  Load the features text file and extracts the list of features containg mean and standard deviations

*  Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation using extracted features from previous step

*  Loads the activity and subject data for each dataset, and merges those columns with the dataset

*  Merges the train and test datasets

*  Replace activity label by their corresponding activity

*  Converts the activity and subject columns into factors

*  Creates a tidy dataset that consists of the average of each variable for each activity and each subject.

*  Saves this tidy dataset as tidydata.txt which is the end-result

#To run the code in this repository:  

*  Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*  Unzip it to 'UCI HAR Dataset'
*  open a R console and set the working directory to the folder containg 'UCI HAR Dataset'
*  Run the script run_analysis.R from here
*  tidydata.txt will be created in the working directory
