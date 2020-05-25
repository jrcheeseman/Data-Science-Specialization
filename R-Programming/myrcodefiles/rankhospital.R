# Returns df of hospitals ordered by outcome and rank within specified state
# jrcheeseman (2020)

rankhospital <- function(state, outcome, num = "best") {

  # Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- suppressWarnings(as.numeric(data[, 11]))
  data[, 17] <- suppressWarnings(as.numeric(data[, 17]))
  data[, 23] <- suppressWarnings(as.numeric(data[, 23]))

  # Check that state, outcome, and num are valid
  if (!(state %in% state.abb)) {
    stop("invalid state")
  } else if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
    stop("invalid outcome")
  } else if (!((num %in% c("best", "worst")) || (num %% 1 == 0))) {
    stop("invalid num")
  }

  # Return hospital name in that state with the given rank
  # 30-day death rate
  temp <- data[data$State == state, ]

  if (num == "best") {
    if (outcome == "heart attack") {
      sorted <- temp[order(temp[, 11], temp[, 2], na.last = NA), ]
    } else if (outcome == "heart failure") {
      sorted <- temp[order(temp[, 17], temp[, 2], na.last = NA), ]
    } else if (outcome == "pneumonia") {
      sorted <- temp[order(temp[, 23], temp[, 2], na.last = NA), ]
    }
    name <- sorted[1, "Hospital.Name"]
  } else if (num == "worst") {
    if (outcome == "heart attack") {
      sorted <- temp[order(-temp[, 11], temp[, 2], na.last = NA), ]
    } else if (outcome == "heart failure") {
      sorted <- temp[order(-temp[, 17], temp[, 2], na.last = NA), ]
    } else if (outcome == "pneumonia") {
      sorted <- temp[order(-temp[, 23], temp[, 2], na.last = NA), ]
    }
    name <- sorted[1, "Hospital.Name"]
  } else {
    if (outcome == "heart attack") {
      sorted <- temp[order(temp[, 11], temp[, 2], na.last = NA), ]
    } else if (outcome == "heart failure") {
      sorted <- temp[order(temp[, 17], temp[, 2], na.last = NA), ]
    } else if (outcome == "pneumonia") {
      sorted <- temp[order(temp[, 23], temp[, 2], na.last = NA), ]
    }
    name <- sorted[num, "Hospital.Name"]
  }

  name <- as.character(name)
  name
}
