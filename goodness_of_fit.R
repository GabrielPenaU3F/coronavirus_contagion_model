library(Metrics)

calculate_determination_coefficient <- function(real_data, estimated_data){
  sstot <- calculate_sstot(real_data)
  ssres <- calculate_ssres(real_data, estimated_data)
  rsq <- 1 - (ssres/sstot)
  rsq
}

calculate_rrse <- function(real_data, estimated_data){
  rrse(real_data, estimated_data)
}

calculate_sstot <- function(real_data){
  ybar <- mean(real_data)
  squares <- (real_data - ybar)^2
  sstot <- sum(squares)
  sstot
}

calculate_ssres <- function(real_data, estimated_data){
  residuals <- real_data - estimated_data
  ssres <- sum(residuals^2)
  ssres
}
