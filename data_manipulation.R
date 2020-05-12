library(zoo)

format_data_for_fitting <- function(data_vector){
  data_vector <- remove_nas(data_vector)
  first_nonzero_day <- min(which(data_vector > 0))
  fittable_data <- data_vector[first_nonzero_day:length(data_vector)]
}

remove_nas <- function(data_vector){
  data <- as.vector(na.locf(data_vector))
}

format_country_name <- function(country_id){
  name <- gsub("[.]", " ", country_id)
}

format_dataset_name <- function(dataset_id){
  name_lowercase <- gsub("[_]", " ", dataset_id)
  name <- paste(toupper(substring(name_lowercase, 1,1)), substring(name_lowercase, 2), sep="", collapse=NULL)
  name
}

format_main_plot_ylabel <- function(dataset){
  ylabel <- paste('Number of ', gsub(paste0('total_',collapse = "|"),"", dataset))
}

create_mtbi_dataframe <- function(days, mtbis){
  mtbi_data <- data.frame(
    day <- days,
    mtbi <- mtbis
  )
  colnames(mtbi_data) <- c('day', 'mtbi')
  mtbi_data
}