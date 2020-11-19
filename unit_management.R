# It is assumed that mtbis is in days
select_right_units <- function(mtbis, plot_unit){
  if (plot_unit == 'min') {
    mtbis <- mtbis * 1440
  } else if (plot_unit == 'sec') {
    mtbis <- mtbis * 86400
  }
  mtbis
}