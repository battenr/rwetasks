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

#' Mean by group
#'
#' @param df a dataframe
#' @param x a vector / variable to calculate the mean and SD for
#' @param grouping_var a vector/variable to group by
#'
#' @return the mean and sd for each group of the specified variable
#' @export
mean_by_group <- function(df, x, grouping_var) {
  x <- enquo(x)
  grouping_var <- enquo(grouping_var)

  df.out <- df %>%
    dplyr::group_by(
      !!grouping_var
    ) %>%
    dplyr::summarise(
      mean = base::round(base::mean(!!x), 2),
      sd = base::round(stats::sd(!!x), 2)
    )

  return(df.out)
}

#' Median by group
#'
#' @param df a dataframe
#' @param x a vector / variable to calculate the median and IQR for
#' @param grouping_var a vector/variable to group by
#'
#' @return the median and IQR for each group of the specified variable
#' @export
median_by_group <- function(df, x, grouping_var) {
  x <- enquo(x)
  grouping_var <- enquo(grouping_var)

  df.out <- df %>%
    dplyr::group_by(
      !!grouping_var
    ) %>%
    dplyr::summarise(
      median = base::round(stats::median(!!x), 2),
      IQR = base::round(stats::IQR(!!x), 2)
    )

  return(df.out)
}

#' Calculate count and proportion for variables
#'
#' @param df a dataframe or tibble
#' @param x  variable to get count and percent of
#'
#' @return a dataframe with number and percent of each group
#' @export
count_percent <- function(df, x){

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
count_percent_unique <- function(df, x, pt_id){

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
