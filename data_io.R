library(RCurl)

read_csv_data <- function(url) {
  csv <- read.csv(url(url))
}


save_csv_data <- function(data) {
  write.csv(data)
}

data_is_in_workspace <- function(){
  exists("total_cases_dataset")
}