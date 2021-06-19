# Calculating the number of treatments

#' Number of Treatments
#'
#' @param df a dataframe
#' @param x a variable
#' @param value treatment to look for, for example: "allergy medication"
#'
#' @return
#' @export
num_trt <- function(df, x, value){
  x <- enquo(x)

  df %>%
    dplyr::filter(
      !!x == value
    )
}

#' Number of Patients with a Treatment
#'
#' @param df a dataframe
#' @param x a variable
#' @param value the treatment being specified, for example: "allergy medication"
#' @param id a patient identifier
#'
#' @return
#' @export
num_pts_trt <- function(df, x, value, id){ # number of patients with a unique treatment
  x <- enquo(x)
  id <- enquo(id)

  df %>%
    dplyr::filter(
      !!x == value
    ) %>%
    dplyr::distinct(
      !!id
    )
}
