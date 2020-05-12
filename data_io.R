library(RCurl)

default_data_source <- 'https://covid.ourworldindata.org/data/ecdc/total_cases.csv'
default_deaths_source <-  'https://covid.ourworldindata.org/data/ecdc/total_deaths.csv'
current_data_source <- default_data_source
current_deaths_source <- default_deaths_source

read_csv_data <- function(url) {
  csv <- read.csv(url(url))
}

save_data_to_csv <- function(data, filename){
  filename <- paste(filename, '.csv', sep='')
  write.csv(data, filename)
}

update_data <- function(){
  total_cases_dataset <<- read_csv_data(current_data_source)
  total_deaths_dataset <<- read_csv_data(current_deaths_source)
}

change_data_source_url <- function(url){
  current_data_source <- url
}

change_deaths_source_url <- function(url){
  current_deaths_source <- url
}

reset_data_sources_to_default <- function(){
  current_data_source <- default_data_source
  current_deaths_source <- default_deaths_source
}

save_mtbi <- function(save, country, days, mtbis){
  mtbi_data <- create_mtbi_dataframe(days, mtbis)
  if (save == 'workspace'){
    varname <- paste("mtbi_", country, sep = "")
    assign(varname, mtbi_data, inherits=TRUE)
  } else if (save == 'csv'){
    filename = paste("mtbi_", country, sep='')
    save_data_to_csv(mtbi_data, filename)
  }
}