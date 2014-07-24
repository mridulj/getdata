==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

# Transformation on the data
The code comments have all the following steps listed clearly.
* Concat the columns from "UCI HAR Dataset/*/X_*.txt" and "UCI HAR Dataset/train/y_*.txt" dataset into a single table for each of the training and test set.This column would get lost later and has to be reconcatenated (and so could have been cbind(ed) later); I am going by the order of the 5 tasks given, so that each of them could be evaluated independently
* Task1:  Merge the training and the test sets to create one data set (dat)
* Read in the features file "UCI HAR Dataset/features.txt" and extract the mean and std deviation feature codes/index.
* For task4 ahead, extract the labels for features right away (fmean,fstd)
* Task2: Extract from the data result (dat) of Task1, only the measurements on the mean and standard deviation for each measurement (dat_mean_std)
* For task3, first combine the training and test data for activities into a single tall column
  * Replace the numeric code of the activity with the proper labels given in activity_labels.txt.Use gsubfn instead of looping over with gsub, 6 times for each activity
* Task3: Use descriptive activity names to name the activities in the data set (dat_mean_std_activity)
  * Concat the columns which has mean,std and activity labels for each record
* Task4: Appropriately label the data set with descriptive variable names. names(dat_mean_std_activity)
  * Use the feature labels extracted earlier for mean and std and create a tall column as mean and std come next to each other in the table 
* For task 5, first name a tall column of the subject, merging the training and test set i.e "UCI HAR Dataset/t*/subject_t*.txt"
  * Add the subject column to the rest of the big table (dat_mean_std_activity_sub)
  * Now that we have the big table, calculate task 5
* Task 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject. (tidydata)

# Variables
The data cleaning project doesn't specify any specific "mean" or "standard deviation" to be extracted. So I have extracted all possible in the dataset. A domain definition and meaning of each of these
is given in detail in the next section i.e "Features".

* "activity" : Activities performed by each subject wearing a smartphone (Samsung Galaxy S II) on the waist. One of WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING
* "subject" : Group of 30 volunteers within an age bracket of 19-48 years. Value of the variable between 1-30 (both inclusive)
* "tBodyAcc-mean-X" "tBodyAcc-mean-Y" "tBodyAcc-mean-Z" - Mean of body acceleration signals in the corresponding X,Y & Z directions
* "tGravityAcc-mean-X" "tGravityAcc-mean-Y" "tGravityAcc-mean-Z" - Mean of gravity acceleration signals in the corresponding X,Y & Z directions
* "tBodyAccJerk-mean-X" "tBodyAccJerk-mean-Y" "tBodyAccJerk-mean-Z" - Mean of Jerk signal in corresponding X,Y & Z directions, derived in time from body linear acceleration
* "tBodyGyro-mean-X" "tBodyGyro-mean-Y" "tBodyGyro-mean-Z" - Mean of body angular velocity in corresponding X,Y & Z direction
* "tBodyGyroJerk-mean-X" "tBodyGyroJerk-mean-Y" "tBodyGyroJerk-mean-Z" - Mean of Jerk signal in corresponding X,Y & Z directions, derived in time from body angular velocity
* "tBodyAccMag-mean" "tGravityAccMag-mean" "tBodyAccJerkMag-mean" "tBodyGyroMag-mean" "tBodyGyroJerkMag-mean" - Mean magnitude of the three-dimensional signals which were calculated using the Euclidean norm for corresponding body acceleration, gravity acceleration, jerk signal form body linear acceleration, body angular velocity and jerk signal from body angular velocity.
* "fBodyAcc-mean-X" "fBodyAcc-mean-Y" "fBodyAcc-mean-Z" -  Mean of signals produced by applying Fast Fourier Transform (FFT) in the corresponding X,Y & Z directions for body acceleration.
* "fBodyAccJerk-mean-X" "fBodyAccJerk-mean-Y" "fBodyAccJerk-mean-Z" -  Mean of signals produced by applying Fast Fourier Transform (FFT) in the corresponding X,Y & Z directions for jerk signal from body linear acceleration
* "fBodyGyro-mean-X" "fBodyGyro-mean-Y" "fBodyGyro-mean-Z" -  Mean of signals produced by applying Fast Fourier Transform (FFT) in the corresponding X,Y & Z directions for body angular velocity
* "fBodyAccMag-mean" "fBodyBodyAccJerkMag-mean" "fBodyBodyGyroMag-mean" "fBodyBodyGyroJerkMag-mean" - Mean of signals produced by applying FFT for body acceleration, jerk signals second order dervied from body linear acceleration, second order body angular velocity and jerk signals second order derivative from body angular velocity
* "tBodyAcc-std-X" "tBodyAcc-std-Y" "tBodyAcc-std-Z" - standard deviation of body acceleration signals in the corresponding X,Y & Z directions
* "tGravityAcc-std-X" "tGravityAcc-std-Y" "tGravityAcc-std-Z" - standard  deviation gravity acceleration signals in the corresponding X,Y & Z directions
* "tBodyAccJerk-std-X" "tBodyAccJerk-std-Y" "tBodyAccJerk-std-Z" - standard deviation Jerk signal in corresponding X,Y & Z directions, derived in time from body linear acceleration
* "tBodyGyro-std-X" "tBodyGyro-std-Y" "tBodyGyro-std-Z" - standard deviation body angular velocity in corresponding X,Y	 & Z direction
* "tBodyGyroJerk-std-X" "tBodyGyroJerk-std-Y" "tBodyGyroJerk-std-Z" - standard deviation Jerk signal in corresponding X,Y & Z directions, derived in time from body angular velocity
* "tBodyAccMag-std" "tGravityAccMag-std" "tBodyAccJerkMag-std" "tBodyGyroMag-std" "tBodyGyroJerkMag-std" - standard deviation magnitude of the three-dimensional signals which were calculated using the Euclidean norm for corresponding body acceleration, gravity acceleration, jerk	signal form body linear  acceleration, body angular velocity and jerk signal from body angular velocity.
* "fBodyAcc-std-X" "fBodyAcc-std-Y" "fBodyAcc-std-Z" - standard	deviation signals produced by applying Fast Fourier Transform (FFT) in the corresponding X,Y & Z directions for body acceleration.
* "fBodyAccJerk-std-X" "fBodyAccJerk-std-Y" "fBodyAccJerk-std-Z" - standard deviation of signals produced by applying Fast Fourier Transform (FFT) in the corresponding X,Y & Z directions for jerk signal from body linear acceleration
* "fBodyGyro-std-X" "fBodyGyro-std-Y" "fBodyGyro-std-Z" - standard deviation of signals produced by applying Fast Fourier Transform (FFT) in the corresponding X,Y & Z directions for body angular velocity
* "fBodyAccMag-std" "fBodyBodyAccJerkMag-std" "fBodyBodyGyroMag-std" "fBodyBodyGyroJerkMag-std" - standard deviation of signals produced by applying FFT for body  acceleration, jerk signals second order dervied from body linear acceleration, second order body angular velocity and jerk signals second order derivative from body angular velocity

# Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

# Dataset
The dataset under directory "UCI HAR Dataset" includes the following files:
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

