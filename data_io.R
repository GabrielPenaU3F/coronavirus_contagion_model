library(RCurl)

default_data_source <- "https://covid.ourworldindata.org/data/ecdc/total_cases.csv"
current_data_source <- default_data_source

read_csv_data <- function(url) {
  csv <- read.csv(url(url))
}


save_csv_data <- function(data) {
  write.csv(data)
}

update_data <- function(){
  read_csv_data(current_data_source)
}