# Functions for Calculating Annualized Cost

#' Annualize variable
#'
#' @param df A dataframe or tibble
#' @param x variable to be converted to an annualized estimate
#' @param var_months variable used indicating the number of months
#'
#' @return variable annualized (per variable per year)
#' @export
annualized <- function(df, x, var_months) {
  x <- enquo(x)
  var_months <- enquo(var_months)

  df %>%
    dplyr::mutate(
      annualized_x = !!x / (!!var_months/12)
    )
}

