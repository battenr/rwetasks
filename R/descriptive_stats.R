# Descriptive Statistics


#' Calculate Mean and Standard Deviation
#'
#' @param x a numeric vector x (ie, df$x)
#'
#' @return returns the mean (SD) rounded to 2 decimal places
#' @export
mean_sd <- function(x) {
  mean <- base::round(base::mean(x), 2)
  sd <- base::round(base::sd(x), 2)

  df.out <- base::paste0(mean, " (", sd, ")")

  return(df.out)
}
