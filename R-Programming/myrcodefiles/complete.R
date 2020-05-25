# Reads in a directory of csv files with leading zeros and returns a single dataframe
# jrcheeseman (2020)

complete <- function(directory, id = 1:332) {
  data <- data.frame()
  for (i in id) {
    if (i < 10) {
      filename <- paste(directory, "/00", i, ".csv", sep = "")
    } else if (i < 100) {
      filename <- paste(directory, "/0", i, ".csv", sep = "")
    } else {
      filename <- paste(directory, "/", i, ".csv", sep = "")
    }
    data_id <- read.csv(filename)
    data_nobs <- data.frame(id = i, nobs = nrow(na.omit(data_id)))
    data <- rbind(data, data_nobs)
  }
  data
}
