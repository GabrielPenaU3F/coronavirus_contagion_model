library(zoo)

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
  colnames(params_data) <- c('day', 'gamma', 'gamma/rho')
  params_data
}
