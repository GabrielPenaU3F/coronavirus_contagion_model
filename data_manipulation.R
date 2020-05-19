library(zoo)

format_data_for_fitting <- function(data_vector){
  data_vector <- remove_nas(data_vector)
  first_nonzero_day <- min(which(data_vector > 0))
  fittable_data <- data_vector[first_nonzero_day:length(data_vector)]
}

remove_nas <- function(data_vector){
  data <- as.vector(na.locf(data_vector))
}

format_country_name_for_showing <- function(country_id){
  name <- gsub("[.]", " ", country_id)
}

format_country_name_for_saving <- function(country_id){
  name <- gsub("[.]", "_", country_id)
}

format_dataset_name_for_showing <- function(dataset_id){
  name_lowercase <- gsub("[_]", " ", dataset_id)
  name <- paste(toupper(substring(name_lowercase, 1,1)), substring(name_lowercase, 2), sep="", collapse=NULL)
  name
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

create_mtbi_dataframe <- function(days, mtbis){
  mtbi_data <- data.frame(
    day <- days,
    mtbi <- mtbis
  )
  colnames(mtbi_data) <- c('day', 'mtbi')
  mtbi_data
}

create_parameters_over_time_dataframe <- function(days, a_s, b_s){
  params_data <- data.frame(
    day <- days,
    gamma <- a_s,
    gamma_over_rho <- b_s
  )
  colnames(params_data) <- c('day', 'gamma', 'gamma/rho')
  params_data
}
