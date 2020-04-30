determine_subset_end <- function(country, end_argument){
  if (end_argument == -1){
    end_argument = get_country_dataset_length(country)
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