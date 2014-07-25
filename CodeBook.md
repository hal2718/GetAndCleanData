---
title: "codebook"
output: html_document
---


#Introduction
This codebook describes the feature variables found in the cleandata1.txt and cleandata2.txt "tidy" data files
satifying ther equirement for the Getting and Cleaning data course project. 


#Measurement Processing and Instruments: 
 3-axis accelerometer, 3-axis gyroscope
 Time domain features (features prefixed with a "t")  
 Frequency domain values (features prefixed with a "f")

----------------------
- [the following paragraph is extracted from original ICR HAR Dataset readme and features_into files]
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.  
------------------------

*The project assignment instruction called for extracting only those features containing the mean and standard deviation.  There are 79 such features out of 571.*

#Variables and Observations
file contains 10299 observations and 81 variabllibrary("kintr")es.  
There are 79 feature columns plus a column for the activity feature and column identifying the subject

*The file cleandata1.txt is the first tidy file.  It contains the features as described here.  The values are extracted from the original input file.*

*The file cleandata2.txt is the second tidy file. It contains the same features as described here but the values are the mean values of the measurements grouped by the same subject and activity*

*The feature names were "cleaned up" by removing the parenthesis in each feature name*

 
format of table below... feature name        (feature purpose)                                      (data type)   (Data Range if available)  
  
..................identifying attributes.........................................   
  subject      (identifies volunteeer by unique integer)                     (integer)      (1-30)      
  activity    (identifies six activities)                                  (factor)       (walking, walking_upstairs, walking_downstairs, laying, standing,sitting)  
 
..................time domain measurements.......................................  
tBodyAcc.mean.X   (3-axis Accelerometer mean and standard dev.)         (numeric)      
tBodyAcc.mean.Y                                                         (numeric)  
tBodyAcc.mean.Z                                                           (numeric)    
tBodyAcc.std.X                                                            (numeric)    
  
tBodyAcc.std.Y                                                            (numeric)  
tBodyAcc.std Z                                                            (numeric)  
  
tGravityAcc.mean.X  (3-axis gravity Aacceleraometer mean and standrd.dev) (numeric)  
tGravityAcc.mean.Y                                                        (numeric)  
tGravityAcc.mean.Z                                                        (numeric)  
tGravityAcc.std.X                                                         (numeric)  
tGravityAcc.std.Y                                                         (numeric)  
tGravityAcc.str.Z                                                         (numeric)  
      
tBodyAccJerk.mean.X  (3-axis Accelerometer "jerk" mean and standard dev.)   (numeric)        
tBodyAccJerk.mean.Y                                                       (numeric)  
tBodyAccJerk.mean.Z                                                       (numeric)  
tBodyAccJerk.std.X                                                        (numeric)  
tBodyAccJerk.std.Y                                                        (numeric)  
tBodyAccJerk.std.Z                                                        (numeric)  
  
tBodyAccMag.mean       (magnitude Accelerometer mean and standard dev.)     (numeric)      
tBodyAccMag.std                                                           (numeric)    
tGravityAccMag.mean    (magnitude Gyroscope mean and standard dev.)      (numeric)  
tGravityAccMag.std                                                        (numeric)  
tBodyAccJerkMag.mean   (magnitude "jerk" Accelerometer mean and standard dev.)     (numeric)  
tBodyAccJerkMag.std                                                       (numeric)  
tBodyGyroMag.mean      (magnitude Gyroscope mean and standard dev.)         (numeric)  
tBodyGyroMag.std                                                          (numeric)  
tBodyGyroJerkMag.mean   (magnitude Gyroscope "jerk" mean and standard dev)  (numeric)        
tBodyGyroJerkMag.std                                                      (numeric)  

.................... frequency domain measurements features .........................  
fBodyAcc.meanFreq.X      (3-axis accelerometer mean frequency  measurement) (numeric)        
fBodyAcc.meanFreq.Y                                                       (numeric)    
fBodyAcc.meanFreq.Z                                                       (numeric)    
          
fBodyAccJerk.mean.X      (3-axis Accelerometer "jerk" mean frequency)       (numeric)          
fBodyAccJerk.mean.Y                                                       (numeric)    
fBodyAccJerk.mean.Z                                                       (numeric)    
fBodyAccJerk.std.X       (3-axis Accelerometer "jerk" standard deviation of frequency) (numeric)         
fBodyAccJerk.std.Y                                                        (numeric)    
fBodyAccJerk.std.Z                                                        (numeric)      
fBodyAccJerk.meanFreq.X   (3-axis Accelerometer "jerk" mean frequency)      (numeric)    
fBodyAccJerk.meanFreq.Y                                                   (numeric)    
fBodyAccJerk.meanFreq.Z                                                   (numeric)    
        
fBodyGyro.mean.X          (3-axis Gyroscopic mean frequency)                (numeric)          
fBodyGyro.mean.Y                                                          (numeric)   
fBodyGyro.mean.Z                                                          (numeric)    
fBodyGyro.std.X           (3-axis Gyroscope frequency standard deviation)   (numeric)     
fBodyGyro.std.Y                                                           (numeric)    
fBodyGyro.std.Z                                                           (numeric)   
fBodyGyro.meanFreq.X      (3-axis  Gyroscope mean frequency                (numeric)  
fBodyGyro.meanFreq.Y                                                      (numeric)    
fBodyGyro.meanFreq.Z                                                      (numeric)    
          
fBodyAccMag.mean         (estimated mean magnitude body Acceloration)       (numeric)                  
fBodyAccMag.std                                                           (numeric)    
fBodyAccMag.meanFreq                                                      (numeric)    
                      
fBodyBodyAccJerkMag.mean  (est mean "jerk" magnitude body Acceleration)     (numeric)          
fBodyBodyAccJerkMag.std                                                   (numeric)    
fBodyBodyAccJerkMag.meanFreq                                              (numeric)      
  
fBodyBodyGyroMag.mean     (est mean magnitude body Gyroscope)               (numeric)             
fBodyBodyGyroMag.std                                                      (numeric)    
fBodyBodyGyroMag.meanFreq                                                 (numeric)    
  
fBodyBodyGyroJerkMag.mean (est body mean magnitude "jerk" Gyroscope)        (numeric)    
fBodyBodyGyroJerkMag.std                                                  (numeric)    
fBodyBodyGyroJerkMag.meanFreq:                                            (numeric)    
      
(end)  