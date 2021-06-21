# Descriptive Statistics


#' Calculate Mean and Standard Deviation
#'
#' @param x a numeric vector x (ie, df$x)
#'
#' @return returns the mean (SD) rounded to 2 decimal places
#' @export
mean_sd <- function(x) {
  calculated.mean <- base::round(base::mean(x), 2)
  calculated.sd <- base::round(stats::sd(x), 2)

  df.out <- base::paste0(calculated.mean, " (", calculated.sd, ")")

  return(df.out)
}

#' Calculate Median and Interquartile Range (IQR)
#'
#' @param x a numeric vector x (ie, df$x)
#'
#' @return returns the mean (SD) rounded to 2 decimal places
#' @export
median_iqr <- function(x) {
  calculated.median <- base::round(stats::median(x), 2)
  calculated.IQR <- base::round(stats::IQR(x), 2)

  df.out <- base::paste0(calculated.median, " (", calculated.IQR, ")")

  return(df.out)
}
