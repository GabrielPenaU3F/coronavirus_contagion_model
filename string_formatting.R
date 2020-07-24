format_country_name_for_showing <- function(country_id){
  name <- gsub("[.]", " ", country_id)
}

format_country_name_for_saving <- function(country_id){
  name <- gsub("[.]", "_", country_id)
  name <- tolower(name)
}

format_dataset_name_for_showing <- function(dataset_id){
  name_lowercase <- gsub("[_]", " ", dataset_id)
  name <- paste(toupper(substring(name_lowercase, 1,1)), substring(name_lowercase, 2), sep="", collapse=NULL)
}

format_dataset_name_for_saving <- function(dataset_id){
  name_lowercase <- gsub("[_]", " ", dataset_id)
  name <- paste(toupper(substring(name_lowercase, 1,1)), substring(name_lowercase, 2), sep="", collapse=NULL)
  name <- tolower(name)
}

format_varname_for_saving <- function(title, dataset_id, country_id){
  varname <- paste(title, "_", format_dataset_name_for_saving(dataset_id), "_", format_country_name_for_saving(country_id), sep="")
}

format_mean_time_between_letter <- function(dataset_id){
  if (dataset_id == 'total_cases'){
    letter <- 'I'
  } else if (dataset_id == 'total_deaths'){
    letter <- 'D'
  }
  letter
} 

format_mean_time_between_full_title <- function(dataset_id, country_id){
  if (dataset_id == 'total_cases'){
    mtb <- 'Mean time between infections'
  } else if (dataset_id == 'total_deaths'){
    mtb <- 'Mean time between deaths'
  }
  full_title <- paste(mtb, ", data from ", format_country_name_for_showing(country_id), sep="")
} 

format_main_plot_ylabel <- function(dataset){
  ylabel <- paste('Number of ', gsub(paste0('total_',collapse = "|"),"", dataset))
}

get_unit_string <- function(plot_unit){
  if (plot_unit == 'day'){
    string <- '(days)'
  } else if (plot_unit  == 'min') {
    string <- '(min)'
  }
  string
}
