show_availiable_countries <- function(){
  n_of_columns <- length(total_cases_dataset[1,])
  names <- colnames(total_cases_dataset)
  countries <- names[-1:-2]
}

get_data_from_country <- function(country){
  data <- total_cases_dataset[[country]]
}

get_country_dataset_length <- function(country){
  length <- length(total_cases_dataset[[country]])
}