library(minpack.lm)

source("data_io.R")


fit_contagion_model <- function(country) {
  data_url = "https://covid.ourworldindata.org/data/ecdc/total_cases.csv"
  dataset = read_csv_data(data_url)
  country_data <- dataset[[country]][31:length(dataset[[country]])]
  len_subset <- length(country_data)
  country_dataset <- list("M" = len_subset, "x" = c(1:len_subset),"Y" = country_data)
  nlm_fit <- obtain_nlm_fit(country_dataset)
  coefs <- coef(nlm_fit)
  plot(Y ~ x,data=country_dataset,type='l')
  lines(0:100, predict(nlm_fit, newdata = data.frame(x = 0:100)), col='red')
}

obtain_nlm_fit <- function(country_dataset){
  nlm <- nlsLM(Y ~ 1/b * ((1 + a * x)^b - 1), data=country_dataset, start=list(a=0.1, b=1))
}