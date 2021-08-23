#' Resample Data
#'
#' @param times_to_resample number of times to resample
#' @param df.vector vector to draw samples from
#' @param sample_size_drawn number of samples to draw
#' @param replace_response sample with replacement. By default, TRUE
#'
#' @return
#' @export
resample_data <- function(times_to_resample, df.vector, sample_size_drawn, replace_response = TRUE){
  resampled <- base::replicate(times_to_resample,
                               base::sample(df.vector,
                                            size = sample_size_drawn,
                                            replace = replace_response
                               )
  )

  resampled = resampled %>%
    base::as.data.frame() %>%
    varhandle::unfactor()

  return(resampled)
}
