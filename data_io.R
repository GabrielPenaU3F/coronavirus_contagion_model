library(RCurl)

default_data_source <- 'https://covid.ourworldindata.org/data/owid-covid-data.csv'
current_data_source <- default_data_source

read_csv_data <- function(url, sep = ',') {
  if (startsWith(url, 'http')){
    csv <- read.csv(url(url), sep=sep)
  } else {
    csv <- read.csv(file = url, sep=sep)
  }
}

update_data <- function(){
  full_dataset <<- read_csv_data(current_data_source)
}

change_data_source_url <- function(url){
  current_data_source <- url
}


reset_data_sources_to_default <- function(){
  current_data_source <- default_data_source
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

save_fit <- function(save, dataset, country, days, predicted_values){
  fit_data <- create_fit_dataframe(days, predicted_values)
  if (save == 'workspace'){
    save_data_to_workspace('fit', dataset, country, fit_data)
  } else if (save == 'csv'){
    save_data_to_csv('fit', dataset, country, fit_data)
  }
}