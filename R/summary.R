# Calculating Descriptive Stats

#' Calculate count and percent for variables
#'
#' @param df a dataframe or tibble
#' @param x  variable to get count and percent of
#'
#' @return a dataframe with number and percent of each group
count_percent <- function(df, x){
  require(magrittr)

  x <- rlang::enquo(x)

  n.df <- nrow(df)

  df.out <- df %>%
    dplyr::group_by(
      !!x
    ) %>%
    dplyr::add_count() %>%
    dplyr::summarise(
      n = n,
      prop = n / n.df
    ) %>%
    dplyr::slice(1) %>%
    dplyr::arrange(
      dplyr::desc(n)
    )

  return(df.out)
}

# Calculating n and % for demographic characteristics

#' Calculate count and percent for unique participant ids
#'
#' @param df a dataframe or tibble
#' @param x variable x
#' @param pt_id patient identifier
#'
#' @return a dataframe with number and percent of each group
#' @export
count_percent_demo <- function(df, x, pt_id){
  require(magrittr)

  x <- rlang::enquo(x)
  pt_id <- rlang::enquo(pt_id)

  df.unique <- df %>%
    dplyr::distinct(
      !!pt_id
    )

  n.df <- nrow(df.unique)

  df.out <- df %>%
    dplyr::distinct(
      !!pt_id,
      .keep_all = TRUE
    ) %>%
    dplyr::group_by(
      !!x
    ) %>%
    dplyr::add_count() %>%
    dplyr::summarise(
      n = n,
      prop = n / n.df
    ) %>%
    dplyr::slice(1) %>%
    dplyr::arrange(
      dplyr::desc(n)
    )

  return(df.out)
}
