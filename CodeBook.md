#Cleaning and Getting Data Code Book

With their embedded accelerometer and gyriscopes,modern smartphones make an excellent tool for studying human movements. The authors of numerous publications studying Human Activity using Smartphones have made their data tables available for analysis.  

A description of the data set and citations to recent publications can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data tables used for this assignment were downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

___

##Description of downloaded data tables and files
<li>Activity_labels - contains list of 6 measured activity labels</li>
<li>features - list of 561 measured features</li>
<li>features_info - describes the measured features, variables, and calculated variables</li>
<li>README - brief description of the study and data sets</li>
<li>X_test/train - Observation data for 561 collected variables</li>
<li>y_test/train - list of activities associated with each observation</li>
<li>test/train subject_test - list of patients associated with each observation</li>

___

##Data Handling and Cleaning Methods##
the script run_analysis.R performs the following transformations to the inmported data

1. To both the test and train data tables, completed the following;
    a. Joined the observation associated activities (from y_train/test) with the human readable Activity names
    b. To the observed data (X_train/test), used the features data as column names (see below) 
    c. Selected columns with the strings “mean” OR “std
    d. Added subjectID and Activities to data tables
2. Using rbind, merge train and test data tables
3. Summarized the mean of each column using summarise_by(funs(mean))

ASSUMPTION: the features data table contained 561 observations and the observed data tables (X_train/test) contained 561 columns.  It was assumed that each row in the features data table corresponds to each column in the observed data tables, thus making it possible to use the features data table as column names for the observed data tables.

One problem with the features data table is that it contained duplicate names that would result in duplicate column names in the observed data tables.  Therefore, the feature data table was processed using the following method

1. make.unique {base} function was applied to the features data table
2. second column (containing feature name) was extracted as a character vector
3. using colnames, the character vector was applied to the both train and test observed data tables

___

##Data variables
A description of the features can be found at UCI data website (see above)

###List of variables:
<li>tBodyAcc-mean()-X</li>
<li>tBodyAcc-mean()-Y</li>
<li>tBodyAcc-mean()-Z</li>
<li>tBodyAcc-std()-X</li>
<li>tBodyAcc-std()-Y</li>
<li>tBodyAcc-std()-Z</li>
<li>tGravityAcc-mean()-X</li>
<li>tGravityAcc-mean()-Y</li>
<li>tGravityAcc-mean()-Z</li>
<li>tGravityAcc-std()-X</li>
<li>tGravityAcc-std()-Y</li>
<li>tGravityAcc-std()-Z</li>
<li>tBodyAccJerk-mean()-X</li>
<li>tBodyAccJerk-mean()-Y</li>
<li>tBodyAccJerk-mean()-Z</li>
<li>tBodyAccJerk-std()-X</li>
<li>tBodyAccJerk-std()-Y</li>
<li>tBodyAccJerk-std()-Z</li>
<li>tBodyGyro-mean()-X</li>
<li>tBodyGyro-mean()-Y</li>
<li>tBodyGyro-mean()-Z</li>
<li>tBodyGyro-std()-X</li>
<li>tBodyGyro-std()-Y</li>
<li>tBodyGyro-std()-Z</li>
<li>tBodyGyroJerk-mean()-X</li>
<li>tBodyGyroJerk-mean()-Y</li>
<li>tBodyGyroJerk-mean()-Z</li>
<li>tBodyGyroJerk-std()-X</li>
<li>tBodyGyroJerk-std()-Y</li>
<li>tBodyGyroJerk-std()-Z</li>
<li>tBodyAccMag-mean()</li>
<li>tBodyAccMag-std()</li>
<li>tGravityAccMag-mean()</li>
<li>tGravityAccMag-std()</li>
<li>tBodyAccJerkMag-mean()</li>
<li>tBodyAccJerkMag-std()</li>
<li>tBodyGyroMag-mean()</li>
<li>tBodyGyroMag-std()</li>
<li>tBodyGyroJerkMag-mean()</li>
<li>tBodyGyroJerkMag-std()</li>
<li>fBodyAcc-mean()-X</li>
<li>fBodyAcc-mean()-Y</li>
<li>fBodyAcc-mean()-Z</li>
<li>fBodyAcc-std()-X</li>
<li>fBodyAcc-std()-Y</li>
<li>fBodyAcc-std()-Z</li>
<li>fBodyAcc-meanFreq()-X</li>
<li>fBodyAcc-meanFreq()-Y</li>
<li>fBodyAcc-meanFreq()-Z</li>
<li>fBodyAccJerk-mean()-X</li>
<li>fBodyAccJerk-mean()-Y</li>
<li>fBodyAccJerk-mean()-Z</li>
<li>fBodyAccJerk-std()-X</li>
<li>fBodyAccJerk-std()-Y</li>
<li>fBodyAccJerk-std()-Z</li>
<li>fBodyAccJerk-meanFreq()-X</li>
<li>fBodyAccJerk-meanFreq()-Y</li>
<li>fBodyAccJerk-meanFreq()-Z</li>
<li>fBodyGyro-mean()-X</li>
<li>fBodyGyro-mean()-Y</li>
<li>fBodyGyro-mean()-Z</li>
<li>fBodyGyro-std()-X</li>
<li>fBodyGyro-std()-Y</li>
<li>fBodyGyro-std()-Z</li>
<li>fBodyGyro-meanFreq()-X</li>
<li>fBodyGyro-meanFreq()-Y</li>
<li>fBodyGyro-meanFreq()-Z</li>
<li>fBodyAccMag-mean()</li>
<li>fBodyAccMag-std()</li>
<li>fBodyAccMag-meanFreq()</li>
<li>fBodyBodyAccJerkMag-mean()</li>
<li>fBodyBodyAccJerkMag-std()</li>
<li>fBodyBodyAccJerkMag-meanFreq()</li>
<li>fBodyBodyGyroMag-mean()</li>
<li>fBodyBodyGyroMag-std()</li>
<li>fBodyBodyGyroMag-meanFreq()</li>
<li>fBodyBodyGyroJerkMag-mean()</li>
<li>fBodyBodyGyroJerkMag-std()</li>
<li>fBodyBodyGyroJerkMag-meanFreq()</li>
<li>angle(tBodyAccMean,gravity)</li>
<li>angle(tBodyAccJerkMean),gravityMean)</li>
<li>angle(tBodyGyroMean,gravityMean)</li>
<li>angle(tBodyGyroJerkMean,gravityMean)</li>
<li>angle(X,gravityMean)</li>
<li>angle(Y,gravityMean)</li>
<li>angle(Z,gravityMean)</li>
</ul>

###Activity Labels
<li>WALKING: subject was walking during the test</li>
<li>WALKING_UPSTAIRS: subject was walking up a staircase during the test</li>
<li>WALKING_DOWNSTAIRS: subject was walking down a staircase during the test</li>
<li>SITTING: subject was sitting during the test</li>
<li>STANDING: subject was standing during the test</li>
<li>LAYING: subject was laying down during the test</li>
