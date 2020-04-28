library(RCurl)

read_csv_data <- function(url) {
  csv <- read.csv(url(url))
}


save_csv_data <- function(data) {
  write.csv(data)
}
