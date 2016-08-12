
##The unzipped folder is in the working directory of R at present. 

##Load features and convert them from factor to character class

features <- read.table("./UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])


# Extract only the list of features containing the phrases 'mean' or 'std' in a character vector featuresReqd
featuresReqd <- grep(".*mean.*|.*std.*", features[,2])
featuresReqd.names = features[featuresReqd,2]

#Clean the feature names and substitute mean and std by MEAN and SD respectively for clarity. Also remove parantheses
featuresReqd.names = gsub('mean', 'MEAN', featuresReqd.names)
featuresReqd.names = gsub('std', 'SD', featuresReqd.names)
featuresReqd.names <- gsub('[()]', '', featuresReqd.names)


#Importing the datasets

#Xtrain contains train data only correponding to features in featuresReqd
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")[featuresReqd]

#Read the activities and subjects file which have the same number of rows as dataset in train
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Now apply cbind so each row has Subject, Activity and the values of selected features for corresponding activity of subject
train <- cbind(trainSubjects, trainActivities, Xtrain)

#Now repeating the same procedure for test dataset

Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresReqd]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, Xtest)

#Now merge the train and test dataframes
mergedData <- rbind(train, test)

#Naming the variables in mergedData
colnames(mergedData) <- c("Subject", "Activity", featuresReqd.names)

#Replacing activity from numeric to descriptive form
acivitycode <- c(WALKING=1, WALKING_UPSTAIRS=2, WALKING_DOWNSTAIRS=3, SITTING=4, STANDING=5, LAYING=6)
mergedData$Activity <- names(acivitycode)[match(mergedData$Activity, acivitycode)]

#Convert activity and subject columns to factor type
mergedData$Subject = as.factor(mergedData$Subject)
mergedData$Activity = as.factor(mergedData$Activity)

library(reshape2)
#Now we shall use melt command to pivot data
MeltedmergedData <- melt(mergedData, id = c("Subject", "Activity"))
#Check
nrow(MeltedmergedData)==length(featuresReqd.names)*nrow(mergedData)


#Now we cast the molten data frame to get mean of each variable for each activity and each subject

meandata <- dcast(MeltedmergedData, Subject + Activity ~ variable, mean)



#Writing meandata to tidydata.txt

write.table(meandata, "./tidydata.txt", row.names = FALSE)


#######################END#############################
