#' Resample Data
#'
#' @param times_to_resample number of times to resample
#' @param df.vector vector to draw samples from
#' @param sample_size_drawn number of samples to draw
#' @param replace_response sample with replacement. By default, TRUE
#'
#' @return returns a dataframe, resampled n times
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

#' Counts and Proportions of Resampled Data
#'
#' @param df a dataframe containing resampled data
#' @param sample_size_drawn size of the sample that was drawn
#'
#' @return returns dataframe with counts and proportions for each sample drawn
#' @export
resample_count <- function(df, sample_size_drawn){
  df.counts <- df %>%
    purrr::map_df(~count(data.frame(x = .x), x), .id = "var") %>%
    dplyr::mutate(
      prop = n / sample_size_drawn
    )

  return(df.counts)
}
