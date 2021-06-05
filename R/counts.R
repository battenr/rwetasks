#' Counts number of Unique Pts
#'
#' @param df # a dataframe or tibble
#' @param id # patient id
#'

num_unique_pt <- function(df, id) {
  id <- enquo(id)

  df %>%
    dplyr::distinct(
      !!id
    ) %>%
    count()
}

#' Select only unique patient IDs
#'
#' @param df # dataframe or tibble
#' @param id # patient id
#'

unique_pt <- function(df, id) {
  id <- enquo(id)

  df.new <- df %>%
    dplyr::distinct(
      !!id
    )

  return(df.new)
}
