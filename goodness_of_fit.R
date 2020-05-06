calculate_determination_coefficient <- function(real_data, estimated_data){
  data_sum_of_squared_deviations <- var(real_data) * (length(real_data) - 1)
  explanation_sum_of_squared_deviations <- var(estimated_data) * (length(estimated_data) - 1)
  explanation_sum_of_squared_deviations / data_sum_of_squared_deviations
}