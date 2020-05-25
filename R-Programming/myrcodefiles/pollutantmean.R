# Reads in a directory of csv files and calculates mean of column
# jrcheeseman (2020)

pollutantmean <- function(directory, pollutant, id = 1:332) {
  data <- data.frame()
  for (i in id) {
    if (i < 10) {
      filename <- paste(directory, "/00", i, ".csv", sep = "")
    } else if (i < 100) {
      filename <- paste(directory, "/0", i, ".csv", sep = "")
    } else {
      filename <- paste(directory, "/", i, ".csv", sep = "")
    }
    data <- rbind(data, read.csv(filename))
  }
  mean(data[[pollutant]], na.rm = TRUE)
}
