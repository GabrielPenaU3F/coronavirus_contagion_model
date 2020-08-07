library(Metrics)

calculate_determination_coefficient <- function(real_data, estimated_data){
  data_variance <- var(real_data)
  estimation_variance <- var(estimated_data)
  estimation_variance / data_variance
}

calculate_rmse <- function(real_data, estimated_data){
  rmse(real_data, estimated_data)
}