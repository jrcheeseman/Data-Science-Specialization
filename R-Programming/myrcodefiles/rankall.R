# Returns df of hospitals ordered by outcome and rank within each state
# jrcheeseman (2020)

rankall <- function(outcome, num = "best") {

  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- suppressWarnings(as.numeric(data[, 11]))
  data[, 17] <- suppressWarnings(as.numeric(data[, 17]))
  data[, 23] <- suppressWarnings(as.numeric(data[, 23]))

  ## Check that outcome and num are valid
  if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
    stop("invalid outcome")
  } else if (!((num %in% c("best", "worst")) || (num %% 1 == 0))) {
    stop("invalid num")
  }

  ## For each state, find the hospital of the given rank
  states <- unique(data$State)
  df <- data.frame(matrix(nrow = length(states), ncol = 2))
  rownames(df) <- c(states)
  colnames(df) <- c("hospital", "state")
  for (i in 1:length(states)) {
    temp <- data[data$State == states[i], ]
    if (num == "best") {
      if (outcome == "heart attack") {
        sorted <- temp[order(temp[, 11], temp[, 2], na.last = NA), ]
      } else if (outcome == "heart failure") {
        sorted <- temp[order(temp[, 17], temp[, 2], na.last = NA), ]
      } else if (outcome == "pneumonia") {
        sorted <- temp[order(temp[, 23], temp[, 2], na.last = NA), ]
      }
      hospital <- sorted[1, "Hospital.Name"]
    } else if (num == "worst") {
      if (outcome == "heart attack") {
        sorted <- temp[order(-temp[, 11], temp[, 2], na.last = NA), ]
      } else if (outcome == "heart failure") {
        sorted <- temp[order(-temp[, 17], temp[, 2], na.last = NA), ]
      } else if (outcome == "pneumonia") {
        sorted <- temp[order(-temp[, 23], temp[, 2], na.last = NA), ]
      }
      hospital <- sorted[1, "Hospital.Name"]
    } else {
      if (outcome == "heart attack") {
        sorted <- temp[order(temp[, 11], temp[, 2], na.last = NA), ]
      } else if (outcome == "heart failure") {
        sorted <- temp[order(temp[, 17], temp[, 2], na.last = NA), ]
      } else if (outcome == "pneumonia") {
        sorted <- temp[order(temp[, 23], temp[, 2], na.last = NA), ]
      }
      hospital <- sorted[num, "Hospital.Name"]
    }
    df[i, 1] <- hospital
    df[i, 2] <- states[i]
  }

  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  df[order(df[, 2]), ]
}
