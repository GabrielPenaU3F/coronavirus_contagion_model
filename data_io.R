library(RCurl)

default_data_source <- 'https://covid.ourworldindata.org/data/ecdc/total_cases.csv'
default_deaths_source <-  'https://covid.ourworldindata.org/data/ecdc/total_deaths.csv'
current_data_source <- default_data_source
current_deaths_source <- default_deaths_source

read_csv_data <- function(url) {
  csv <- read.csv(url(url))
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

save_data_to_workspace <- function(title, dataset, country, data){
  varname <- format_varname_for_saving(title, dataset, country)
  assign(varname, data, inherits=TRUE)
}

save_data_to_csv <- function(title, dataset, country, data){
  filename <- paste(format_varname_for_saving(title, dataset, country), '.csv', sep='')
  write.csv(data, filename)
}

save_mtbi <- function(save, dataset, country, days, mtbis){
  mtbi_data <- create_mtbi_dataframe(days, mtbis)
  if (save == 'workspace'){
    save_data_to_workspace('mtb', dataset, country, mtbi_data)
  } else if (save == 'csv'){
    save_data_to_csv('mtb', dataset, country, mtbi_data)
  }
}

save_parameters_over_time <- function(save, dataset, country, days, a_s, b_s){
  params_data <- create_parameters_over_time_dataframe(days, a_s, b_s)
  if (save == 'workspace'){
    save_data_to_workspace('params_over_time', dataset, country, params_data)
  } else if (save == 'csv'){
    save_data_to_csv('params_over_time', dataset, country, params_data)
  }
}