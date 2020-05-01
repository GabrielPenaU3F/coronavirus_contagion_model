determine_subset_end <- function(subset_vector, end_argument){
  if (end_argument == -1){
    end_argument <- length(subset_vector)
  }
  end_argument
}

determine_prediction_limit <- function(predict_until_argument, end){
  
  if (predict_until_argument < end & predict_until_argument != -1) {
    stop("predict_until argument is lower than the indicated dataset end")
  }  else if (predict_until_argument == -1) {
    prediction_limit <- end
  } else {
    prediction_limit <- predict_until_argument
  }
  prediction_limit
}

determine_subset_start <- function(start){
  subset_start <- max(1, start)
}