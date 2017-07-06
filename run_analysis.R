library(data.table)
library(dplyr)
library(plyr)

###MERGE the training and the test sets to create one data set.

# imports list of all features that were collected per subject
features<-fread("./Dataset/features.txt",
                sep = " ",
                col.names = c("featID","feat")
                )

#import list of activities
activity <- fread("./Dataset/activity_labels.txt", 
                  col.names = c("ActID", "Activity")
                  )
###TEST DATA--------------------------------------------------------------

# imports list of subject IDs used in the test dataset
test_subjects<-fread("./Dataset/test/subject_test.txt",
                     sep = " ", col.names = c("SID")
                     )

#Imports test activity associated with test data
test_activity <- fread("./Dataset/test/Y_test.txt",sep = " ", col.names = c("ActID"))
test_activity <- left_join(test_activity, activity, by = "ActID")

# Imports test data
test_data <- fread("./Dataset/test/X_test.txt", sep = " ")

#Add varnames to test data -  this code creates dataframe column vector of feature
#names, finds the duplicate featurenames, makes each unique, and then adds the 
#column names to the test dataset
colnames(test_data) <- make.unique(features[[2]]) 

#selects columns with the string "mean" or "std" in the column name
test_data <- test_data %>% select(matches('mean|std')) 

# combine test subjects and activity with the data
test_data<- cbind(test_subjects, test_activity, test_data)

#remove ActID variable as not needed
test_data <- subset(test_data, select= -c(ActID)) 


###TRAIN DATA--------------------------------------------------------------
# imports list of subject IDs used in the train dataset
train_subjects<-fread("./Dataset/train/subject_train.txt", sep = " ", col.names = c("SID"))

#Imports train activity associated with train data
train_activity <- fread("./Dataset/train/Y_train.txt",sep = " ", col.names = c("ActID"))
train_activity <- left_join(train_activity, activity, by = "ActID")

# Imports test data
train_data <- fread("./Dataset/train/X_train.txt", sep = " ")

#Add varnames to test data -  this code creates dataframe column vector of feature
#names, finds the duplicate featurenames, makes each unique, and then adds the 
#column names to the train dataset
colnames(train_data) <- make.unique(features[[2]]) 

#selects columns with the string "mean" or "std" in the column name
train_data <- train_data %>% select(matches('mean|std')) 

# combine test subjects and activity with the data
train_data<- cbind(train_subjects, train_activity, train_data)

#remove ActID variable as not needed
train_data <- subset(train_data, select= -c(ActID)) 

### Combine Test and Train data sets into one--------------------------------------------
mergedf <- rbind(test_data, train_data)

mergesummary<-mergedf %>% group_by(SID,Activity) %>% summarise_each(funs(mean))

# Write mergesummary data to file
write.table(mergesummary, file="mergesummary.txt", row.name=FALSE)
