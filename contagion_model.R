library(minpack.lm)


fit_contagion_model <- function(country, predict_until=-1, start=1, end=-1, dataset='total_cases', save=-1) {

  country_real_data <- select_dataset(dataset, country)
  country_fittable_data <- format_data_for_fitting(country_real_data)
  len_dataset <- length(country_fittable_data)
  
  start <- determine_subset_start(start)
  end <- determine_subset_end(country_fittable_data, end)
  prediction_limit <- determine_prediction_limit(predict_until, end)
  
  requested_subset <- country_fittable_data[start:end]
  len_subset <- length(requested_subset)
  
  dataset_xy_points<- list("x" = c(1:len_dataset),"Y" = country_fittable_data)
  subset_xy_points <- list("x" = c(start:end),"Y" = requested_subset)
  
  nlm_fit <- obtain_nlm_fit(subset_xy_points)
  coefs <- coef(nlm_fit)
  predicted_values <- predict(nlm_fit, newdata = data.frame(x = 1:prediction_limit))
  
  display_title(dataset, country)
  display_estimated_coefficients(coefs)
  display_fit_statistics(requested_subset, predicted_values[start:length(predicted_values)])
  display_end_of_printing()
  
  prediction_x_limit <- prediction_limit
  visual_x_limit <- determine_plot_x_lim(prediction_limit, length(country_fittable_data))
  y_limit <- determine_plot_y_lim(requested_subset, predicted_values)
  create_dataset_plot(dataset_xy_points, country, dataset, visual_x_limit, y_limit) 
  add_prediction_plot(prediction_x_limit, predicted_values)
  add_plot_legend()
  
}

obtain_nlm_fit <- function(country_dataset){
  nlm <- nlsLM(Y ~ ((1 + a * x)^b - 1)/b, 
               data=country_dataset, start=list(a=0.1, b=1), 
               control=nls.lm.control(maxiter=150))
}

analyze_model_parameters_over_time <-function(country, start_from=30, by=1, end=-1, save=-1, dataset='total_cases'){
  
  country_real_data <- select_dataset(dataset, country)
  country_fittable_data <- format_data_for_fitting(country_real_data)
  end <- determine_subset_end(country_fittable_data, end)
  
  a_params <- vector()
  b_params <- vector()
  t_sequence <- seq(start_from, end, by)
  if (!(end %in% t_sequence)){
    t_sequence <- c(t_sequence, end)
  }
  for (index in t_sequence) {
    coefs <- determine_coefficients_until(country_fittable_data, index)
    a <- coefs[1]
    b <- coefs[2]
    a_params <- c(a_params, a)
    b_params <- c(b_params, b)
  }
  
  plot_parameters_over_time(country, dataset, a_params, b_params, start_from, end, by)
  
  if (save != -1){
    save_parameters_over_time(save, dataset, country, t_sequence, a_params, b_params)
  }
  
}

calculate_mtbi <- function(country, start_from=30, by=1, end=-1, save=-1, dataset='total_cases', plot_unit='day'){
  
  country_real_data <- select_dataset(dataset, country)
  country_fittable_data <- format_data_for_fitting(country_real_data)
  end <- determine_subset_end(country_fittable_data, end)

  mtbis <- vector()
  t_sequence <- seq(start_from, end, by)
  if (!(end %in% t_sequence)){
    t_sequence <- c(t_sequence, end)
  }
  for (index in t_sequence) {
    coefs <- determine_coefficients_until(country_fittable_data, index)
    a <- coefs[1]
    b <- coefs[2]
    mtbi <- calculate_estimated_mtbi(a, b, index)
    mtbis <- c(mtbis, mtbi)
  }
  
  minimum_status <- check_minimum_status(mtbis)
  
  plot_mbti(country, dataset, mtbis, start_from, end, by, plot_unit)
  display_mtbi_minimum(minimum_status, min(mtbis), plot_unit)
  
  if (save != -1){
    save_mtbi(save, dataset, country, t_sequence, mtbis)
  }
}


determine_coefficients_until <- function(fittable_data, end){
  subset_xy_points<- list("x" = c(1:end),"Y" = fittable_data[1:end])
  nlm_fit <- obtain_nlm_fit(subset_xy_points)
  coefs <- coef(nlm_fit)
}

calculate_estimated_mtbi <- function(a, b, day){
  parenthesis = 1 + a * day
  mtbi <- parenthesis / (a * (parenthesis^b - 1))
}

check_minimum_status <- function(mtbis){
  min(mtbis) != mtbis[length(mtbis)]
}