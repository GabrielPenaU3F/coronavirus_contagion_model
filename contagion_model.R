library(minpack.lm)


fit_contagion_model <- function(country, predict_until=-1, start=1, end=-1) {

  country_real_data <- get_data_from_country(country)
  country_fittable_data <- format_data_for_fitting(country_real_data)
  len_dataset <- length(country_fittable_data)
  
  start <- determine_subset_start(start)
  end <- determine_subset_end(country_fittable_data, end)
  prediction_limit <- determine_prediction_limit(predict_until, end)
  
  requested_subset <- country_fittable_data[start:end]
  len_subset <- length(requested_subset)
  
  dataset_xy_points<- list("M" = len_dataset, "x" = c(1:len_dataset),"Y" = country_fittable_data)
  subset_xy_points <- list("M" = len_subset, "x" = c(start:end),"Y" = requested_subset)
  
  nlm_fit <- obtain_nlm_fit(subset_xy_points)
  coefs <- coef(nlm_fit)
  predicted_values <- predict(nlm_fit, newdata = data.frame(x = 0:prediction_limit))
  
  display_estimated_coefficients(coefs)
  
  x_limit <- prediction_limit
  y_limit <- determine_plot_y_lim(requested_subset, predicted_values)
  create_dataset_plot(dataset_xy_points, country, x_limit, y_limit) 
  add_prediction_plot(x_limit, predicted_values)
  add_plot_legend()
  
}

obtain_nlm_fit <- function(country_dataset){
  nlm <- nlsLM(Y ~ ((1 + a * x)^b - 1)/b, data=country_dataset, start=list(a=0.1, b=1))
}