# Calculating counts and percentages

#' Number of Unique Values
#'
#' @param df dataframe, or tibble.
#' @param x vector / variable that you want unique number of (i.e, patient identifier, age group, sex)
#'
#' @return  number of unique values
#' @export
num_unique <- function(df, x) {

  x <- rlang::enquo(x)

  df %>%
    dplyr::distinct(
      !!x
    ) %>%
    dplyr::count()
}



#' Unique Values

#'
#' @param df dataframe, or tibble
#' @param x vector / variable that you want unique number of (i.e, patient identifier, age group, sex)
#'
#' @return dataframe of unique values (i.e, patient identifiers)
#' @export
unique_values <- function(df, x) {

  x <- rlang::enquo(x)

  df.new <- df %>%
    dplyr::distinct(
      !!x
    )

  return(df.new)
}
