display_estimated_coefficients <- function(coefs){
  rho = coefs[[1]]
  gamma_over_rho = coefs[[2]]
  cat("\n\n--------------------\n\n")
  cat("Coefficients: \n\n")
  cat(paste(intToUtf8(961), " = ", rho, "\n", sep="", collapse=NULL))
  cat(paste(intToUtf8(947), "/", intToUtf8(961), " = ", gamma_over_rho, "\n", sep="", collapse=NULL))
  cat("\n--------------------\n\n")
}