display_estimated_coefficients <- function(coefs){
  a = coefs[[1]]
  b = coefs[[2]]
  cat("\n\n--------------------\n\n")
  cat("Coefficients: \n\n")
  cat(paste("a = ", a, "\n", sep="", collapse=NULL))
  cat(paste("b = ", b, "\n", sep="", collapse=NULL))
  cat("\n--------------------\n\n")
}