determine_plot_y_lim <- function(requested_subset, predicted_y){
  y_lim <- max(c(max(requested_subset),max(predicted_y)))
}

determine_plot_x_lim <- function(prediction_limit, end){
  x_lim <- max(prediction_limit, end)
}