library(zoo)

format_data_for_fitting <- function(data_vector){
  fittable_vector <- as.vector(na.locf(data_vector))
}
