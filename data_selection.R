library(dplyr)

show_availiable_countries <- function(){
  countries <- distinct(full_dataset, location)$location
  print(countries)
}

get_data_from_country <- function(country, dataset){
  country_data <- filter(full_dataset, location==country)
  if (dataset == 'total_cases'){
    data <- as.vector(select(country_data, total_cases)$total_cases)
  } else if (dataset == 'total_deaths'){
    data <- as.vector(select(country_data, total_deaths)$total_deaths)
  }
}

show_data_from_country <- function(country, dataset='total_cases'){
  print(get_data_from_country(country, dataset))
}
