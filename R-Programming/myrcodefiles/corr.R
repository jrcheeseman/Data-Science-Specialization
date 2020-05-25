# Reads in a directory of csv files and calculates correlations of columns
# jrcheeseman (2020)

corr <- function(directory, threshold = 0) {
  correlations <- vector("numeric")
  for (i in 1:332) {
    if (i < 10) {
      paste(directory, "/00", i, ".csv", sep = "")
    } else if (i < 100) {
      filename <- paste(directory, "/0", i, ".csv", sep = "")
    } else {
      filename <- paste(directory, "/", i, ".csv", sep = "")
    }
    data <- read.csv(filename)
    if (nrow(na.omit(data)) > threshold) {
      correlations <- c(correlations, cor(x = data["sulfate"], y = data["nitrate"], use = "complete.obs"))
    }
  }
  if (length(correlations) > 0) {
    correlations
  } else {
    correlations <- vector("numeric")
    correlations
  }
}
