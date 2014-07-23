trn_x <- read.table("UCI HAR Dataset/train/X_train.txt")
trn_y <- read.table("UCI HAR Dataset/train/y_train.txt")
tst_x <- read.table("UCI HAR Dataset/test/X_test.txt")
tst_y <- read.table("UCI HAR Dataset/test/y_test.txt")

#concat the columns from x and y dataset into a single table for each of the training and test set
#Though this column would get lost later and has to be reconcatenated and so could have been cbind(ed) later
#I am going by the order of the 4 tasks given, so that each of them could be evaluated independently
trn <- cbind(trn_x,trn_y)
tst <- cbind(tst_x,tst_y)
#Task1:  Merge the training and the test sets to create one data set.
dat <- rbind(trn,tst)

#Read in the features file and extract the mean and std deviation feature codes/index.
#For task4 ahead, extract the labels for features right away
features <- read.table("UCI HAR Dataset/features.txt")
fmean <- features[grep("mean\\(\\)",features$V2),c("V1","V2")]
fstd <- features[grep("std\\(\\)",features$V2),c("V1","V2")]

#Task2: Extract from dat, only the measurements on the mean and standard deviation for each measurement
dat_mean <- dat[,fmean$V1]
dat_std <- dat[,fstd$V1]
dat_mean_std <- cbind(dat_mean,dat_std)

#For task3, first combine the training and test data for activities into a single tall column
dat_activity <- rbind(trn_y,tst_y)
#Now replace the numeric code of the activity with the proper labels given in activity_labels.txt.Using gubfn instead of 
#looping over with gsub, 6 times for each activity
library(gsubfn)
activity <- gsubfn(".",list("1"="WALKING","2"="WALKING_UPSTAIRS","3"="WALKING_DOWNSTAIRS","4"="SITTING",
                                      "5"="STANDING","6"="LAYING"),as.character(dat_activity$V1))
#Task3: Use descriptive activity names to name the activities in the data set
#Concat the columns which has mean,std and activity labels for each record
dat_mean_std_activity <- cbind(dat_mean_std,activity)

#Task4: Appropriately label the data set with descriptive variable names. 
#Use the feature labels extracted earlier for mean and std and create a tall column as mean and std come next to each other in the table
mean_std_name <- c(as.character(fmean$V2),as.character(fstd$V2))
colnames <- c(mean_std_name,"activity")
#Complete task 4 now
names(dat_mean_std_activity) <- colnames

#For task 5, first name a tall column of the subject, merging the training and test set
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- c(subtrain$V1,subtest$V1)
#Add the subject column to the rest of the big table
dat_mean_std_activity_sub <- cbind(dat_mean_std_activity,subject)
#Now that we have the big table, calculate task 5
#Task 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)
melted <- melt(dat_mean_std_activity_sub,id=c("activity","subject"))
tidydata <- dcast(melted,activity+subject~variable,mean)
write.table(tidydata, "tidyresults.txt", row.names = FALSE)



