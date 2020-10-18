# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate how to collect, work with, and clean a data set. 

The goal is to prepare tidy data that can be used for later analysis.

run_analysis.R reads the relevant data files, makes them tidy, and outputs tidy_data.txt

CodeBook.md describes how the data were transformed, and basic details about the variables in tidy_data.txt

Data files: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data consist of accelerometer measurements from the Samsung Galaxy S smartphone during various activities. 

A full description of the files can be found in the original README.txt file, and here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set is split into several files which need to be reshaped and combined. 

The script run_analysis.R does this in the following steps:

  1. Read subject column for training and test data
  2. Read activity column, replace numbers with labels, and join to subject column
  3. Read accelerometer data
  4. Replace column headers with descriptive variable names
  5. Bind subject, activity, and accelerometer data columns
  6. Add indicator column for test and train sets
  7. Move indicator column to first position
  8. Bind rows from each subset to create one data set
  9. Subset the data to the mean and standard deviation for each measurement
  10. Reshape the accelerometer data columns into one column
  11. Create a tidy data set with the average of each variable for each activity and each subject
  12. Write data to file
  
