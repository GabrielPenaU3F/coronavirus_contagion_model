library(minpack.lm)


fit_contagion_model <- function(country,start=1,end=-1) {
  
  if (end == -1){
    end = get_country_dataset_length(country)
  }

  country_real_data <- get_data_from_country(country)
  len_dataset <- length(country_real_data)
  requested_subset <- country_real_data[start:end]
  len_subset <- length(requested_subset)
  
  dataset_xy_points<- list("M" = len_dataset, "x" = c(1:len_dataset),"Y" = country_real_data)
  subset_xy_points <- list("M" = len_subset, "x" = c(start:end),"Y" = requested_subset)
  
  nlm_fit <- obtain_nlm_fit(subset_xy_points)
  coefs <- coef(nlm_fit)
  
  plot(Y ~ x,data=dataset_xy_points,type='l')
  lines(0:100, predict(nlm_fit, newdata = data.frame(x = 0:100)), col='red')
  
}

obtain_nlm_fit <- function(country_dataset){
  nlm <- nlsLM(Y ~ ((1 + a * x)^b - 1)/b, data=country_dataset, start=list(a=0.1, b=1))
}

contagion_mean_value_function <- function(x,a,b){
  y <- ((1 + a * x)^b - 1)/b
}