Getting and Cleaning Data Course Project
========================================
The goal of the software/script bundled in this repository is to prepare a tidy data set that can be used for analysis as part of the projects under "Data Specialization Course" by Coursera.
The dataset for the project could be obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Introduction
There is one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

While you could have each of these in scripts of there own, I opted to have a single script and achieve all the above via it. Also, while I could have pre-optimized the statements to achieve 
the final result of tidying the data; I thought it would be better to execute each of the above tasks explicitly. Each step is commented clearly in the R file. A very miniscule cost is incurred
in redoing some steps(like reconcatenating some columns which got dropped) in order to show the output of each of the above tasks, separately.

# Setup 

## Prerequisites
* Make sure you have R and Rscript installed on your system. 
* On the r prompt install the following R packages
* install.packages(gsubfn)
* install.packages(reshape2)

## Running the project
* git clone https://github.com/mridulj/getdata.git
* cd getdata
* Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzip it into a sub-directory "UCI HAR Dataset"
* Run "Rscript run_analysis.R" from the current dir i.e getdata
* You should see the results in a file called "tidyresults.txt", in the current directory. This file if required can be loaded into R for further data analysis using read.table()
