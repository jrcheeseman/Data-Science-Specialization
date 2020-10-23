# Code Book for Course Project

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

The final tidy data set has the following variables:

| Variable       | Type         | Minimum      | Maximum      | Description  |
| :------------- | :----------: | -----------: | -----------: | -----------: |
| Variable       | Character    | NA           | NA           | Type of measured sensor data |
| Activity       | Character    | NA           | NA           | Type of physical activity performed by the subject during measurement  |
| Subject        | Integer      | 1            | 30           | Experimental subject identification number |
| Average        | Numeric      | -0.9976661   | 0.9745087    | Average measurement value per variable, subject, and activity |

Note to grader: 

The assignment instructions did not clearly distinguish what information is expected in the CodeBook and README files. The first set of instructions say "...a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected." But during submission the instructions were "You should include a README.md in the repo describing how the script works and the code book describing the variables." I attempted to provide all of the required information in both the CodeBook and README files, even though this repeats some of the same information. I hope you will understand...
