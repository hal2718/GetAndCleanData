---
title: "README"
output: html_document
---

# *WEARABLE COMPUTERS PROJECT*

This README file covers the files and other items from the Course Project from the JHU Coursera Getting and Cleaning Data Course.
#

The source data for this project is located at the following URL:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In order to run the script you must first download and unzip the above file.  This produces a two tier directory structure
containing a discussion of theory, varaible labels, and measurement data.  These are described below in Section 2 below.  
*(IMPORTANT) Running the script will require that the local directory pointer be set to the local working directory*

# *Section I Introduction*  

The purpose of the R script  in this directory is to clean up and present two "tidy" data sets from a data set.  The input
dataset are sensor data taken from thirty volunteers wearing  Samsung Galaxy S II smartphones.  This smartphone contains embedded
accelerometer and gyroscope. Sensor data in the input file contains 3-axial linear acceleration, 3 axial angular velocity sampled
at a constant rate of 50Hz.  Each of the thirty participants is recorded performing six activities: WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. 

The accelerometer and gyroscope signals were pre-processed, the deails of this pre-processing are described in the codebook.


The input data was randomly partitioned into into two data sets called training and test. 70% of the participant entries were randomly
assigned to the training and the remaining 30% were assigned to the test data set. 

# Section 2  Input: Names and purpose of the Input Directories, Subdirectories  and Files    
  
main directory: *UCI HAR Dataset*  
Files in main directory:  
- README.TXT  
Describes the subdirectories, file and the file content   
- activity_labels  
Contains the text list of the six activiites   
- features.txt  
A list of the 561 features labels  
- feature_info.txt  
A discussion identifying the definition and origin of the 561 features  
  
Subdirectories in the main directory  
- test  
- train  
Files contained in the *test* subdirectory  
-X_test.txt  
561 features for the 30% of volunteers assigned to the test dataset  
- subject_test.txt  
a file containing the integers representing the identity of the volunteers for each line in the X_test.txt file.  
- y_test.txt  
a file containing an integer (range 1-6) representing one of the six activities peformed for each line in the X_test.txt file  
- Inertial Signals subdirectory is not used in this analysis.  
  
Files contained the *train* directory  
-X_train.txt  
561 features for the 70% of volunteers assigned to the train dataset  
- subject_train.txt  
a file containing the integers representing the identity of the volunteers for each line in the X_train.txt file.  
- y_train.txt  
a file containing an integer (range 1-6) representing one of the six activities peformed for each line in the X_train.txt file  
- Inertial Signals subdirectory is not used in this analysis.  
  
# Section 3  Description of the RUN_ANALYSIS.R Script     

 1. Assume the file has been downloaded and the directories and files unzipped.  The directory structure is described in section 2 above    
 2. The *RUN_ANALYSIS SCRIPT* is composed of *FIVE* major sections.     
  3. In the *FIRST SECTION*, the working directory is set to the main directory ("UCI HAR Datset").    
  The feature.txt file containing 561 feature names is read into a dataframe. Those features containing the mean or standard deviation are
identified and saved in a character vector.  These are further processed to remove the "()" to make them more readable.
The corresponding line numbers are also extracted and save in an integer vector.    
4. In the  SECOND SECTION  the working directory is changed to the test directory and the data set containing the measurements is read into a datatrame.  
From this dataframe the features columns whose feature names contain mean or standard deviation are extracted.  The column are assigned feature names at this point. 
Next, the activity file and subject file are read, These two variables are added as new columns to the data frame.    
5. In the  THIRD SECTION  the working directory is changed to the training subdirectory and the X_train.txt file is read containing feature values for the 70% of volunteers.  
The following steps closely parallel what was done in step 3 above.  The columns corresponding to features with std or mean are extracted (recall this was previously calcualted).
Column names are assigned to these columns and the activity and subject files are read and assigned as new columns.   
6. In the  FOURTH SECTION  the data frames for the training and test dataset are combined with rbind, they resulting dataframe is then sorted first by subject and the activity using the order function.  
The column containing the activity index is replaced with the text for the activity.  This completes the processing for the first tidy data set.  The data frame is writen as filename="cleandata1.txt"
using the write.csv function.     
7. The  FIFTH SECTION  processes the previously created tidy dataframe to create a new tidy data frame containing the mean of all the features by subject and activity.     
The plyr package function ddply is used
to do the processing. The ddply can split the input data set by the two variables to create temporary dataframes that can be further processed by an included function.  In the 
application of that here the included function is "apply(combinedDS[,1:78",2,mean)" which applies the mean function to all entries in the groups split out by subject and activity. The
result is a dataframe containing the mean value for all measurement of each subject and each activity across all the features.   The resulting data frame is written out using the write.csv
function as the filename="cleanfile2.txt"      
8. OUTPUT.    
Two files in csv format are produced by the script.  The first file named "cleandata1.csv" contains column features for all variables with mean or standard deviation, This file contains column headers that are the
tidy feature names. The second file is named "cleandata2.csv" contains the mean value for all feature split by subject and actvity. This file also contains column headers taht are the 
feature names. These feature names are the same as those appearing as feature names in the cleandata1.txt file.   

- (end)