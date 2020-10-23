
# Read subject column for training and test data
test <- read.table("./test/subject_test.txt", col.names = c("subject"))
train <- read.table("./train/subject_train.txt", col.names = c("subject"))

# Read activity column, replace numbers with labels, and join to subject column
test["activity"] <- join(read.table("./test/y_test.txt"), 
                         read.table("./activity_labels.txt"), 
                         by='V1') %>% select(V2)
train["activity"] <- join(read.table("./train/y_train.txt"), 
                          read.table("./activity_labels.txt"), 
                          by='V1') %>% select(V2)

# Read accelerometer data
X_test <- read.table("./test/X_test.txt")
X_train <- read.table("./train/X_train.txt")

# Replace column headers with descriptive variable names
features <- read.table("./features.txt")
colnames(X_test) <- t(features[2])
colnames(X_train) <- t(features[2])

# Bind subject, activity, and accelerometer data columns
test <- cbind(test, X_test)
train <- cbind(train, X_train)

# Add indicator column for test and train sets
test["set"] <- "TEST"
train["set"] <- "TRAIN"

# Move indicator column to first position
test <- test[,c(ncol(test),1:(ncol(test)-1))]
train <- train[,c(ncol(train),1:(ncol(train)-1))]

# Bind rows from test and train to create one data set
data <- rbind(test, train)

# Subset the data to the mean and standard deviation for each measurement
mean_columns <- data[grepl("mean", colnames(data), fixed=TRUE)]
std_columns <- data[grepl("std", colnames(data), fixed=TRUE)]
subset <- cbind(data["activity"], data["subject"], mean_columns, std_columns)

# Reshape the accelerometer data columns into one column
vars <- colnames(subset)
long_skinny <- reshape2::melt(subset, id=c("activity","subject"), measure.vars=vars[3:81])

# Create a tidy data set with the average of each variable for each activity and each subject
groups <- group_by(long_skinny, variable, activity, subject)
tidy_data <- dplyr::summarize(groups, average = mean(value))

# Write data to file
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
