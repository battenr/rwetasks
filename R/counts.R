# Calculating counts and percentages

#' Number of Unique Patients
#'
#' @param df dataframe, or tibble.
#' @param id patient identifier
#'
#' @return  number of unique patient identifiers
#' @export
num_unique_pt <- function(df, id) {

  id <- rlang::enquo(id)

  df %>%
    dplyr::distinct(
      !!id
    ) %>%
    dplyr::count()
}



#' Unique Patients IDs

#'
#' @param df dataframe, or tibble
#' @param id patient identifier
#'
#' @return dataframe of unique patient identifiers
#' @export
unique_pt <- function(df, id) {

  id <- rlang::enquo(id)

  df.new <- df %>%
    dplyr::distinct(
      !!id
    )

  return(df.new)
}
