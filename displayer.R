display_title <- function(dataset, country){
  cat("\n\n--------------------\n")
  dataset_title <- format_dataset_name_for_showing(dataset)
  cat(paste(dataset_title, " in ", format_country_name_for_showing(country), sep=""))
}

display_estimated_coefficients <- function(coefs){
  rho <- coefs[[1]]
  gamma_over_rho <- coefs[[2]]
  cat("\n--------------------\n\n")
  cat("Coefficients: \n\n")
  cat(paste(intToUtf8(961), " = ", rho, " 1/day \n", sep="", collapse=NULL))
  cat(paste(intToUtf8(947), "/", intToUtf8(961), " = ", gamma_over_rho, "\n", sep="", collapse=NULL))
}

display_fit_statistics <- function(real_values, predicted_values){
  rsquared <- calculate_determination_coefficient(real_values, predicted_values)
  cat("\n--------------------\n\n")
  cat("Goodness of fit statistics:\n\n")
  cat(paste("R2 determination coefficient:"), rsquared, "\n")
}

display_end_of_printing <- function(){
  cat("\n--------------------\n\n")
}

display_mtbi_minimum <- function(minimum_status, minimum, plot_unit){
  string_minimum_status <- get_minimum_status_string(minimum_status)
  cat("\n--------------------\n\n")
  cat(paste("Minimum status:", string_minimum_status, "\n"))
  if (minimum_status == TRUE){
    minimum <- select_right_units(minimum, plot_unit)
    unit_string <- get_unit_string(plot_unit)
    cat(paste("MTBI Minimum:", minimum, unit_string))
  }
  cat("\n--------------------\n")
}
