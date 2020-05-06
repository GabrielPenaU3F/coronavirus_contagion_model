determine_plot_y_lim <- function(requested_subset, predicted_y){
  y_lim <- max(c(max(requested_subset),max(predicted_y)))
}

determine_plot_x_lim <- function(prediction_limit, dataset_length){
  x_lim <- max(prediction_limit, dataset_length)
}

create_dataset_plot <- function(xy_points, country, x_limit, y_limit) {
  title <- paste("Total cases in", country, sep=" ", collapse=NULL)
  plot(Y ~ x, data=xy_points, 
       type='l', main=title, xlab="t (Days)", ylab="Nº of cases", 
       xlim=c(0, x_limit), ylim=c(0, y_limit)
  )
}

add_prediction_plot <- function(prediction_x_limit, predicted_values){
  lines(1:prediction_x_limit, predicted_values, col='red')
}

add_plot_legend <- function(){
  legend("topleft", c("Observed cases", "Model prediction"), fill=c("black", "red"))
}