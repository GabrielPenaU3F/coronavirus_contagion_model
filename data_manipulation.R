library(zoo)

format_data_for_fitting <- function(data_vector){
  data_vector <- remove_nas(data_vector)
  first_nonzero_day <- min(which(data_vector > 0))
  fittable_data <- data_vector[first_nonzero_day:length(data_vector)]
}

remove_nas <- function(data_vector){
  data <- as.vector(na.locf(data_vector))
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
  colnames(params_data) <- c('day', 'rho', 'gamma/rho')
  params_data
}

create_fit_dataframe <- function(days, predicted_values){
  fit_data <- data.frame(
    day <- days,
    values <- predicted_values
  )
  colnames(fit_data) <- c('day', 'values')
  fit_data
}