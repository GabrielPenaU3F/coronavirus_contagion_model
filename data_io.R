library(RCurl)

default_data_source <- 'https://covid.ourworldindata.org/data/ecdc/total_cases.csv'
current_data_source <- default_data_source

read_csv_data <- function(url) {
  csv <- read.csv(url(url))
}


save_data_to_csv <- function(data, filename){
  filename <- paste(filename, '.csv', sep='')
  write.csv(data, filename)
}

update_data <- function(){
  read_csv_data(current_data_source)
}

change_data_source_url <- function(url){
  current_data_source <- url
}

reset_data_source_to_default <- function(){
  current_data_source <- default_data_source
}