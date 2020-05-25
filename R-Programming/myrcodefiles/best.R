# Print the highest ranked hospital name for a given state and outcome
# jrcheeseman (2020)

best <- function(state, outcome) {

  # Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- suppressWarnings(as.numeric(data[, 11]))
  data[, 17] <- suppressWarnings(as.numeric(data[, 17]))
  data[, 23] <- suppressWarnings(as.numeric(data[, 23]))

  # Check that state and outcome are valid
  if (!(state %in% state.abb)) {
    stop("invalid state")
  } else if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
    stop("invalid outcome")
  }

  # Return hospital name in that state with lowest 30-day death rate
  temp <- data[data$State == state, ]
  if (outcome == "heart attack") {
    sorted <- temp[order(temp[, 11], temp[, 2], na.last = NA), ]
  } else if (outcome == "heart failure") {
    sorted <- temp[order(temp[, 17], temp[, 2], na.last = NA), ]
  } else if (outcome == "pneumonia") {
    sorted <- temp[order(temp[, 23], temp[, 2], na.last = NA), ]
  }
  name <- sorted[1, "Hospital.Name"]
  name <- as.character(name)
  name
}
