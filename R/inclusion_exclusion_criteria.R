# For working with inclusion / exclusion criteria

#' For altering inclusion criteria, to see how changing the criteria affects number of patients
#'
#' @param df a dataframe, or tibble
#' @param x variable that is used for inclusion/exclusion criteria
#' @param criteria value of criteria being applied (can be inclusion or exclusion)
#'
#' @return
#' @export
alternate_criteria <- function(df, x, criteria){
  x <- enquo(x)

  df %>%
    dplyr::filter(
      !!x >= criteria
    )
}
