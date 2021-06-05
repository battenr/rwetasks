# Calculating Descriptive Stats

# Calculating n and % for a variable ----

#' Calculate n and % of each group in a variable
#'
#' @param df # a dataframe
#' @param x # variable you want to group by
#'

count_percent <- function(df, x){

  x <- enquo(x)

  n.df <- nrow(df)

  df %>%
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
      desc(n)
    )
}

# Calculating n and % for demographic characteristics ----

#' Calculate n and % for unique pt ids
#'
#' @param df # dataframe
#' @param x # variable you want to group by
#' @param pt_id # participant id
#'

count_percent_demo <- function(df, x, pt_id){
  x <- enquo(x)
  pt_id <- enquo(pt_id)

  df.unique <- df %>%
    dplyr::distinct(
      !!pt_id
    )

  n.df <- nrow(df.unique)

  df %>%
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
      desc(n)
    )
}
