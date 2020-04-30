library(minpack.lm)


fit_contagion_model <- function(country, predict_until=-1, start=1, end=-1) {
  
  
  end <- determine_subset_end(country, end)
  prediction_limit <- determine_prediction_limit(predict_until, end)

  country_real_data <- get_data_from_country(country)
  len_dataset <- length(country_real_data)
  requested_subset <- country_real_data[start:end]
  len_subset <- length(requested_subset)
  
  dataset_xy_points<- list("M" = len_dataset, "x" = c(1:len_dataset),"Y" = country_real_data)
  subset_xy_points <- list("M" = len_subset, "x" = c(start:end),"Y" = requested_subset)
  
  nlm_fit <- obtain_nlm_fit(subset_xy_points)
  coefs <- coef(nlm_fit)
  predicted_y <- predict(nlm_fit, newdata = data.frame(x = 0:prediction_limit))
  
  
  title <- paste("Total cases in", country,sep=" ", collapse=NULL)
  plot(Y ~ x, data=dataset_xy_points, 
       type='l', main=title, xlab="t (Days)", ylab="Nº of cases", 
       xlim=c(0, determine_plot_x_lim(prediction_limit, end)), ylim=c(0, determine_plot_y_lim(requested_subset, predicted_y))
       )
  lines(0:determine_plot_x_lim(prediction_limit, end), predicted_y, col='red')
  legend("topleft", c("Observed cases", "Model prediction"), fill=c("black", "red"))
}

obtain_nlm_fit <- function(country_dataset){
  nlm <- nlsLM(Y ~ ((1 + a * x)^b - 1)/b, data=country_dataset, start=list(a=0.1, b=1))
}