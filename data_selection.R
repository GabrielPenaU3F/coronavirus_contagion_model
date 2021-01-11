library(dplyr)

show_availiable_countries <- function(){
  countries <- distinct(full_dataset, location)$location
  print(countries)
}

get_data_from_country <- function(country, dataset){
  country_data <- filter_country_data(country, dataset)
  if (dataset == 'total_cases'){
    data <- as.vector(country_data$total_cases)
  } else if (dataset == 'total_deaths'){
    data <- as.vector(country_data$total_deaths)
  }
}

show_data_from_country <- function(country, dataset='total_cases', date=FALSE){
  data <- filter_country_data(country, dataset)
  if (date==FALSE) {
    data <- subset(data, select=-c(date))
  }
  print(data)
}

filter_country_data <- function(country, dataset){
  country_data <- filter(full_dataset, location==country)
  if (dataset == 'total_cases'){
    data <- select(country_data, date, total_cases)
    data <- filter(data, !is.na(total_cases))
  } else if (dataset == 'total_deaths'){
    data <- select(country_data, date, total_deaths)
    data <- filter(data, !is.na(total_deaths))  
  }
}