determine_plot_y_lim <- function(requested_subset, predicted_y){
  y_lim <- max(c(max(requested_subset),max(predicted_y)))
}