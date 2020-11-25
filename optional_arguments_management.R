determine_subset_end <- function(dataset_vector, end_argument){
  if (end_argument == -1){
    end_argument <- length(dataset_vector)
  } 
  end <- min(end_argument, length(dataset_vector))
}

determine_prediction_limit <- function(predict_until_argument, start, end){
  
  if (predict_until_argument < end - start & predict_until_argument != -1) {
    stop("predict_until argument is lower than the indicated dataset end")
  }  else if (predict_until_argument == -1) {
    prediction_limit <- end - start + 1
  } else {
    prediction_limit <- predict_until_argument - start
  }
  prediction_limit
}

determine_subset_start <- function(start){
  subset_start <- max(1, start)
}

validate_start_from <- function(start_from, dataset_length) {
  if (start_from > dataset_length){
    stop("start_from argument must be lower than the requested dataset length")
  }
}
