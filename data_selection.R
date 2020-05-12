show_availiable_countries <- function(){
  n_of_columns <- length(total_cases_dataset[1,])
  names <- colnames(total_cases_dataset)
  countries <- names[-1:-2]
  print(countries)
}

get_data_from_country <- function(country){
  data <- as.vector(total_cases_dataset[[country]])
}

get_deaths_from_country <-function(country){
  data <- as.vector(total_deaths_dataset[[country]])
}

show_data_from_country <- function(country){
  print(get_data_from_country(country))
}

show_deaths_from_country <- function(country){
  print(get_deaths_from_country(country))
}