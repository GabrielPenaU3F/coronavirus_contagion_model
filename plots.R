determine_plot_y_lim <- function(requested_subset, predicted_y){
  y_lim <- max(c(max(requested_subset),max(predicted_y)))
}

determine_plot_x_lim <- function(prediction_limit, dataset_length){
  x_lim <- max(prediction_limit, dataset_length)
}

create_dataset_plot <- function(requested_subset, country, dataset, x_limit, y_limit) {
  xy_points <- list("x" = c(1:length(requested_subset)),"Y" = requested_subset)
  title <- ''
  options(scipen=5)
  windows(height = 10, width = 15)
  par(mar=c(5,7,3,2.1))
  plot(Y ~ x, data=xy_points, 
       type='l', main=title, xlab='', ylab='', 
       xlim=c(0, x_limit), ylim=c(0, y_limit), yaxt="n", xaxt="n", lwd = 2
  )
  axis(1, cex.axis=1.5)
  axis(2, cex.axis=1.5)
  mtext(side=1, text='t (días)', line=3, cex=2)
  mtext(side=2, text='Casos totales', line=4, cex=2)
}

add_prediction_plot <- function(start, prediction_x_limit, predicted_values){
  lines(1:prediction_x_limit, predicted_values, col='red',lwd = 2)
}

add_plot_legend <- function(){
  
  op <- par(cex = 2.5)
  text <- c("Datos reales", "Modelo ajustado")
  legend("topleft", c("Datos reales", "Modelo ajustado"), fill=c("black", "red"))
}

plot_parameters_over_time <- function(country, dataset_id, a_params, b_params, start, by, end) {
  par(mfrow=c(1,2))
  plot_param_over_time(a_params, start, end, by, paste(intToUtf8(961), " 1/day", sep=""), 'blue')
  plot_param_over_time(b_params, start, end, by, paste(intToUtf8(947), "/", intToUtf8(961)), 'red')
  mtext(paste("Model parameters over time, data from ", format_country_name_for_showing(country), ", ", tolower(format_dataset_name_for_showing(dataset_id)), " dataset", sep=""), outer=TRUE, cex=1.5, line=-2)
}

plot_param_over_time <- function(params, start, end, by, param_label, color) {
  x_sequence <- c(seq.int(start, end, by))
  if ((start - end)  %% by > 0) {
    x_sequence <- c(x_sequence, end)
  }
  xy_points <- list("x" = c(seq.int(0,end-start,by)),"Y" = params)
  options(scipen=5)
  windows(height = 10, width = 15)
  par(mar=c(5,7,3,2.1))
  plot(Y ~ x, data=xy_points, type='l', xlim=c(0, end-start), ylim=c(0, max(Y)), col=color,
       yaxt="n", xaxt="n", cex.lab=2, lwd=2, xlab='', ylab=''
  )
  axis(1, cex.axis=1.5)
  axis(2, cex.axis=1.5)
  mtext(side=1, text='t (días)', line=3, cex=2)
  mtext(side=2, text='MTBE (seg)', line=4, cex=2)
}
  
plot_mbti <- function(country, dataset, dataset_id, mtbis, start, by, end, plot_unit){
  full_title <- ''
  mtb_letter <- format_mean_time_between_letter(dataset_id) 
  par(mfrow=c(1,1))
  unit_string <- get_unit_string(plot_unit)
  mtbis <- select_right_units(mtbis, plot_unit)
  plot_param_over_time(mtbis, start, end, by, '', 'blue')
  mtext(full_title, outer=TRUE, cex=1.5, line=-3)
}
  
